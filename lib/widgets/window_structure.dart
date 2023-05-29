import 'package:flutter/material.dart';
import 'package:my_portfolio/models/window_model.dart';
import 'package:my_portfolio/utils/font_resource.dart';
import 'package:my_portfolio/utils/image_resource.dart';
import 'package:my_portfolio/widgets/image_button.dart';
import 'package:my_portfolio/widgets/taskbar.dart';
import 'package:provider/provider.dart';

import '../utils/app_provider.dart';

class WindowStructure extends StatefulWidget {
  const WindowStructure({
    super.key,
    required this.windowWidth,
    this.windowHeight,
    required this.topBarHeight,
    required this.bottomBarHeight,
    required this.topLeftCorner,
    required this.topRightCorner,
    required this.bottomLeftCorner,
    required this.bottomRightCorner,
    required this.topBody,
    required this.bottomBody,
    this.topBarChild,
    this.bottomBarChild,
    this.borderRadius,
    this.childBorderRadius,
    required this.child,
  });
  final Widget child;
  final double windowWidth, topBarHeight, bottomBarHeight;
  final double? windowHeight;
  final List<Widget>? topBarChild, bottomBarChild;
  final String topLeftCorner,
      topRightCorner,
      bottomLeftCorner,
      bottomRightCorner,
      topBody,
      bottomBody;
  final BorderRadius? borderRadius, childBorderRadius;

  @override
  State<WindowStructure> createState() => _WindowStructureState();
}

class _WindowStructureState extends State<WindowStructure> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 20,
      shape: BoxShape.rectangle,
      color: const Color(0XFF082EA2),
      borderRadius: widget.borderRadius,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: widget.windowWidth,
        height: widget.windowHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: widget.windowWidth,
              height: widget.topBarHeight,
              child: Stack(children: [
                Positioned.fill(
                    child: Row(
                  children: [
                    if (widget.topLeftCorner.isNotEmpty)
                      TaskbarBody(
                          imageRepeat: ImageRepeat.noRepeat,
                          bodyPart: widget.topLeftCorner,
                          height: widget.topBarHeight,
                          fit: FlexFit.loose),
                    if (widget.topBody.isNotEmpty)
                      Flexible(
                        fit: FlexFit.tight,
                        child: TaskbarBody(
                          imageRepeat: ImageRepeat.repeatX,
                          bodyPart: widget.topBody,
                          height: widget.topBarHeight,
                          fit: FlexFit.tight,
                          children: widget.topBarChild,
                        ),
                      ),
                    if (widget.topRightCorner.isNotEmpty)
                      TaskbarBody(
                          imageRepeat: ImageRepeat.noRepeat,
                          bodyPart: widget.topRightCorner,
                          height: widget.topBarHeight,
                          fit: FlexFit.loose)
                  ],
                )),
              ]),
            ),
            SizedBox(
              width: widget.windowWidth,
              height: (widget.windowHeight != null)
                  ? widget.windowHeight! -
                      widget.topBarHeight -
                      widget.bottomBarHeight
                  : null,
              child: ClipRRect(
                  borderRadius: widget.childBorderRadius ?? BorderRadius.zero,
                  child: widget.child),
            ),
            SizedBox(
              height: widget.bottomBarHeight,
              width: widget.windowWidth,
              child: Row(
                children: [
                  if (widget.bottomLeftCorner.isNotEmpty)
                    TaskbarBody(
                        imageRepeat: ImageRepeat.noRepeat,
                        bodyPart: widget.bottomLeftCorner,
                        height: widget.bottomBarHeight,
                        fit: FlexFit.loose),
                  if (widget.bottomBody.isNotEmpty)
                    Flexible(
                        fit: FlexFit.tight,
                        child: TaskbarBody(
                          imageRepeat: ImageRepeat.repeatX,
                          bodyPart: widget.bottomBody,
                          height: widget.bottomBarHeight,
                          fit: FlexFit.tight,
                          children: widget.bottomBarChild,
                        )),
                  if (widget.bottomRightCorner.isNotEmpty)
                    TaskbarBody(
                        imageRepeat: ImageRepeat.noRepeat,
                        bodyPart: widget.bottomRightCorner,
                        height: widget.bottomBarHeight,
                        fit: FlexFit.loose)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Window extends StatefulWidget {
  const Window(
      {super.key,
      required this.windowSize,
      required this.windowModel,
      required this.parent,
      required this.child,
      this.borderRadius});
  final Size windowSize;
  final WindowModel windowModel;
  final BorderRadiusGeometry? borderRadius;
  final Widget child, parent;

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  final double _toolbarHeight = 30;
  late BorderRadiusGeometry _defaultRadius;
  late Image appTopRight,
      appTopLeft,
      appTopBody,
      taskbarMin,
      taskbarMax,
      taskbarQuit;

  @override
  void initState() {
    super.initState();
    appTopBody = Image.asset(ImageResources().applicationTopBody,
        repeat: ImageRepeat.repeatX);
    appTopLeft = Image.asset(ImageResources().applicationTopLeft);
    appTopRight = Image.asset(ImageResources().applicationTopRight);

    _defaultRadius = widget.borderRadius ??
        const BorderRadius.only(
            topLeft: Radius.circular(7), topRight: Radius.circular(7));
  }

  @override
  void didChangeDependencies() {
    precacheImage(appTopBody.image, context);
    precacheImage(appTopLeft.image, context);
    precacheImage(appTopRight.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
        feedback: Material(color: Colors.transparent, child: widget),
        childWhenDragging: const SizedBox(),
        maxSimultaneousDrags: (widget.windowModel.isDraggable) ? 1 : 0,
        onDragEnd: widget.windowModel.dragWindow,
        child: PhysicalModel(
          elevation: 20,
          shape: BoxShape.rectangle,
          color: const Color(0XFF082EA2),
          borderRadius: (widget.windowModel.isFullScreen)
              ? BorderRadius.zero
              : _defaultRadius as BorderRadius,
          child: ClipRRect(
            borderRadius: (widget.windowModel.isFullScreen)
                ? BorderRadius.zero
                : _defaultRadius,
            child: Container(
              height: widget.windowSize.height,
              width: widget.windowSize.width,
              color: const Color(0XFF082EA2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!widget.windowModel.isMinimized)
                    GestureDetector(
                      onDoubleTap: (widget.windowModel.canFullScreen)
                          ? widget.windowModel.fullScreenToggle
                          : null,
                      child: SizedBox(
                        height: _toolbarHeight,
                        child: Row(
                          children: [
                            if (!widget.windowModel.isFullScreen) appTopLeft,
                            Flexible(
                              child: Stack(
                                children: [
                                  Positioned.fill(child: appTopBody),
                                  Positioned.fill(
                                      child: Padding(
                                    padding: (widget.windowModel.isFullScreen)
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 3.0)
                                        : EdgeInsets.zero,
                                    child: taskbarChildren(context),
                                  ))
                                ],
                              ),
                            ),
                            if (!widget.windowModel.isFullScreen) appTopRight
                          ],
                        ),
                      ),
                    ),
                  Flexible(
                      child: Container(
                          margin: (!widget.windowModel.isFullScreen)
                              ? const EdgeInsets.only(
                                  left: 2, right: 2, bottom: 2)
                              : null,
                          color: Colors.white,
                          child: widget.child))
                ],
              ),
            ),
          ),
        ));
  }

  Widget taskbarChildren(BuildContext context) {
    var apps = Provider.of<System32>(context, listen: false);
    return ClipRect(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Row(
              children: [
                widget.windowModel.windowIcon,
                const SizedBox(width: 5),
                DefaultTextStyle(
                  style: FontResources().windowTitle.copyWith(
                    color: Colors.white,
                    shadows: <Shadow>[
                      const Shadow(
                        offset: Offset(.0, 2.0),
                        blurRadius: 1.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                  child: Text(
                    widget.windowModel.windowName,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: XPImageButton(
                onTap: () => widget.windowModel.minimizeToggle(context),
                enabledImage: ImageResources().taskbarMin),
          ),
          const SizedBox(width: 3),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: XPImageButton(
                onTap: widget.windowModel.fullScreenToggle,
                enabledImage: ImageResources().taskbarFull),
          ),
          const SizedBox(width: 3),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: XPImageButton(
                onTap: () {
                  apps.closeApplication(widget.parent);
                },
                enabledImage: ImageResources().taskbarClose),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_portfolio/models/window_model.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/utils/font_resource.dart';
import 'package:my_portfolio/utils/image_resource.dart';
import 'package:my_portfolio/widgets/image_button.dart';
import 'package:provider/provider.dart';

import '../utils/app_provider.dart';

class Window extends StatefulWidget {
  const Window(
      {super.key, required this.windowSize, required this.windowModel, required this.child, this.borderRadius});
  final Size windowSize;
  final WindowModel windowModel;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  final double _toolbarHeight = 30;
  late BorderRadiusGeometry _defaultRadius;
  late Image taskbarMin, taskbarMax, taskbarQuit;
  int maxSimultaneousDrags = 0;

  Widget topBar = Container(
    decoration: BoxDecoration(gradient: Constants.taskbarStart),
  );

  @override
  void initState() {
    super.initState();
    _defaultRadius =
        widget.borderRadius ?? const BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7));
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
        feedback: Material(color: Colors.transparent, child: widget),
        childWhenDragging: const SizedBox(),
        maxSimultaneousDrags: maxSimultaneousDrags,
        onDragEnd: widget.windowModel.dragWindow,
        child: PhysicalModel(
          elevation: 20,
          shape: BoxShape.rectangle,
          color: const Color(0XFF082EA2),
          borderRadius: (widget.windowModel.isFullScreen) ? BorderRadius.zero : _defaultRadius as BorderRadius,
          child: ClipRRect(
            borderRadius: (widget.windowModel.isFullScreen) ? BorderRadius.zero : _defaultRadius,
            child: Container(
              height: widget.windowSize.height,
              width: widget.windowSize.width,
              color: const Color(0XFF082EA2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!widget.windowModel.isMinimized)
                    InkWell(
                      onDoubleTap: (widget.windowModel.canFullScreen) ? widget.windowModel.fullScreenToggle : null,
                      onHover: (details) {
                        setState(() {
                          if (details && widget.windowModel.isDraggable) {
                            maxSimultaneousDrags = 1;
                          } else {
                            maxSimultaneousDrags = 0;
                          }
                        });
                      },
                      child: SizedBox(
                        height: _toolbarHeight,
                        child: Stack(
                          children: [
                            Positioned.fill(child: topBar),
                            Positioned.fill(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: taskbarChildren(context),
                            ))
                          ],
                        ),
                      ),
                    ),
                  Flexible(
                      child: Container(
                          margin: (!widget.windowModel.isFullScreen)
                              ? const EdgeInsets.only(left: 1, right: 1, bottom: 1)
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
                onTap: () => widget.windowModel.minimizeToggle(context), enabledImage: ImageResources().taskbarMin),
          ),
          const SizedBox(width: 3),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child:
                XPImageButton(onTap: widget.windowModel.fullScreenToggle, enabledImage: ImageResources().taskbarFull),
          ),
          const SizedBox(width: 3),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: XPImageButton(
                onTap: () {
                  apps.closeApplicationByName(widget.windowModel.windowName);
                },
                enabledImage: ImageResources().taskbarClose),
          ),
        ],
      ),
    );
  }
}

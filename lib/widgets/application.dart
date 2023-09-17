import 'package:my_portfolio/models/window_model.dart';
import 'package:my_portfolio/widgets/window_structure.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatefulWidget {
  const Application({super.key, required this.windowModel, required this.child, required this.taskbarChild});
  final WindowModel windowModel;
  final Widget child, taskbarChild;
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Size windowSize = const Size(0, 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox? initializedRenderBox = context.findRenderObject() as RenderBox?;

      setState(() {
        windowSize = initializedRenderBox!.size;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget.windowModel,
        child: Consumer<WindowModel>(
          builder: (context, window, child) {
            return AnimatedPositioned(
                top: window.windowPosition.top,
                left: window.windowPosition.left,
                right: window.windowPosition.right,
                bottom: window.windowPosition.bottom,
                duration: window.hasAnimation ? const Duration(milliseconds: 200) : Duration.zero,
                curve: Curves.easeInOut,
                child: Window(
                  windowSize: windowSize,
                  windowModel: window,
                  child: widget.child,
                ));
          },
        ));
  }
}

class ApplicationTaskbar extends StatelessWidget {
  const ApplicationTaskbar({super.key, required this.windowModel});
  final WindowModel windowModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: () => windowModel.minimizeToggle(context),
        onDoubleTap: () => windowModel.fullScreenToggle(),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 180),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
          decoration: BoxDecoration(
              color: const Color(0XFF3689F9).withOpacity(0.6),
              border: Border.all(style: BorderStyle.solid, width: 2, color: const Color(0XFF3689F9))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              windowModel.windowIcon,
              const SizedBox(
                height: double.infinity,
                width: 5,
              ),
              Flexible(
                child: Text(
                  windowModel.windowName,
                  style: const TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

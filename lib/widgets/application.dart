import 'package:my_portfolio/models/window_model.dart';
import 'package:my_portfolio/widgets/window_structure.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatefulWidget {
  const Application(
      {super.key,
      required this.windowModel,
      required this.parent,
      required this.child});
  final WindowModel windowModel;
  final Widget child, parent;
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Size windowSize = const Size(0, 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox? initializedRenderBox =
          context.findRenderObject() as RenderBox?;

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
                duration: window.hasAnimation
                    ? const Duration(milliseconds: 200)
                    : Duration.zero,
                curve: Curves.easeInOut,
                child: Window(
                  windowSize: windowSize,
                  windowModel: window,
                  parent: widget.parent,
                  child: widget.child,
                ));
          },
        ));
  }
}

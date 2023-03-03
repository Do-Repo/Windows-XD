import 'package:flutter/material.dart';
import 'package:my_portfolio/models/window_model.dart';
import 'package:my_portfolio/utils/image_resource.dart';
import 'package:my_portfolio/widgets/application.dart';
import 'package:webviewx/webviewx.dart';

class InternetExplorer extends StatelessWidget {
  const InternetExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return Application(
      windowModel: WindowModel(
        windowName: "Internet Explorer",
        windowIcon: Image.asset(ImageResources().miniInternetExplorer),
        initialPosition: const RelativeRect.fromLTRB(100, 100, 100, 100),
        canFullScreen: true,
        isDraggable: true,
      ),
      parent: this,
      child: const IExplorerChild(),
    );
  }
}

class IExplorerChild extends StatefulWidget {
  const IExplorerChild({
    super.key,
  });

  @override
  State<IExplorerChild> createState() => _IExplorerChildState();
}

class _IExplorerChildState extends State<IExplorerChild> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return WebViewX(
          initialContent: "https://oldgoogle.neocities.org/2009/",
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        );
      },
    );
  }
}

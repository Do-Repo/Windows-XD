import 'package:flutter/material.dart';
import 'package:my_portfolio/models/window_model.dart';
import 'package:my_portfolio/utils/image_resource.dart';
import 'package:my_portfolio/widgets/application.dart';
import 'package:my_portfolio/widgets/image_button.dart';
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
        child: const IExplorerChild());
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
  double toolbarHeight = 30;
  TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    _urlController.text = "https://oldgoogle.neocities.org/2009/";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0XFFEDEAD7),
          height: toolbarHeight,
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox(width: 10),
              XPImageButton(
                  onTap: () {}, enabledImage: ImageResources().backButton),
              const Text(
                " Back  ",
                style: TextStyle(fontSize: 13),
              ),
              XPImageButton(
                  onTap: () {},
                  enabledImage: ImageResources().backButtonDisabled),
              const SizedBox(width: 20),
              Flexible(
                child: LayoutBuilder(
                    builder: (context, constraints) => Padding(
                          padding: const EdgeInsets.all(3),
                          child: TextField(
                            controller: _urlController,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.only(
                                bottom: constraints.maxHeight / 2,
                                left: 10,
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 1)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 1)),
                            ),
                          ),
                        )),
              ),
              const SizedBox(width: 20),
              XPImageButton(
                  onTap: () {}, enabledImage: ImageResources().goButton),
              const SizedBox(width: 10)
            ],
          ),
        ),
        Container(
          height: 3,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFFEDEAD7), Colors.grey])),
        ),
        Flexible(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return WebViewX(
                initialContent: _urlController.text,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
              );
            },
          ),
        ),
      ],
    );
  }
}

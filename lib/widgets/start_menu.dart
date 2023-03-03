import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/window_structure.dart';

import '../utils/image_resource.dart';
import 'menu_tile.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({super.key});

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  Widget build(BuildContext context) {
    const double topbarHeight = 65;
    const double bottombarHeight = 40;
    const double menuWidth = 550;

    return WindowStructure(
        windowWidth: menuWidth,
        topBarHeight: topbarHeight,
        bottomBarHeight: bottombarHeight,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        topLeftCorner: ImageResources().startMenuTopLeft,
        topRightCorner: ImageResources().startMenuTopRight,
        bottomLeftCorner: ImageResources().startMenuBottomLeft,
        bottomRightCorner: ImageResources().startMenuBottomRight,
        topBody: ImageResources().startMenuTopBody,
        bottomBody: ImageResources().startMenuBottomBody,
        topBarChild: [
          Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            padding: const EdgeInsets.all(2.5),
            child: Image.asset(
              ImageResources().menuAvatar,
              fit: BoxFit.fitHeight,
            ),
          ),
          const Text("Yasine Romdhane",
              style: TextStyle(
                fontFamily: 'Segoe',
                fontSize: 20,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(.0, 3.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ))
        ],
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          height: 450,
          width: menuWidth,
          child: Row(
            children: [
              Flexible(
                  child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    MenuTile(
                        title: "Internet",
                        subtitle: "Internet Explorer",
                        image: ImageResources().internetExplorer,
                        hasOverlay: true,
                        overlayChild: Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                        ),
                        onTap: null)
                  ],
                ),
              )),
              Flexible(
                  child: Container(
                color: const Color(0XFFB7D3FC),
              ))
            ],
          ),
        ));
  }
}

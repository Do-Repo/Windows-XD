import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constants.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({super.key});

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      child: SizedBox(
        height: 500,
        width: 300,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                gradient: Constants.startMenuTop,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.white,
              ),
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(gradient: Constants.taskbarStart),
            ),
          ],
        ),
      ),
    );
  }
}

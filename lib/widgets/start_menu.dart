import 'package:flutter/material.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({super.key});

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 100,
      color: Colors.white,
    );
  }
}

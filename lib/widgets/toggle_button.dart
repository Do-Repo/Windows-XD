import 'package:flutter/material.dart';

class XPToggleButton extends StatefulWidget {
  const XPToggleButton(
      {super.key,
      required this.states,
      required this.stateImages,
      required this.onTap,
      this.currentState,
      this.margin});
  final int states;
  final int? currentState;
  final Function onTap;
  final List<String> stateImages;
  final EdgeInsets? margin;
  @override
  State<XPToggleButton> createState() => _XPToggleButtonState();
}

class _XPToggleButtonState extends State<XPToggleButton> {
  Image manageImages(int currentState) {
    return Image.asset(
      widget.stateImages[currentState],
      gaplessPlayback: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      child: Center(
          child: Container(
              margin: widget.margin,
              child: manageImages(widget.currentState ?? 0))),
    );
  }
}

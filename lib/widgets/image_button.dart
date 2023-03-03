import 'package:flutter/material.dart';

class XPImageButton extends StatefulWidget {
  const XPImageButton({
    super.key,
    required this.onTap,
    required this.enabledImage,
    this.isEnabled,
    this.isActive,
    this.disabledImage,
    this.activatedImage,
  });
  final bool? isActive;
  final Function onTap;
  final String enabledImage;
  final bool? isEnabled;
  final String? disabledImage, activatedImage;

  @override
  State<XPImageButton> createState() => _XPImageButtonState();
}

class _XPImageButtonState extends State<XPImageButton> {
  String imageController(bool isActive, isEnabled) {
    if (isEnabled) {
      if (isActive) {
        return widget.activatedImage ?? widget.enabledImage;
      } else {
        return widget.enabledImage;
      }
    } else {
      return widget.disabledImage ?? widget.enabledImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onTap(),
        child: Image.asset(
          imageController(widget.isActive ?? false, widget.isEnabled ?? true),
          gaplessPlayback: true,
        ));
  }
}

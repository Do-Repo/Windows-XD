import 'package:flutter/material.dart';

mixin MenuOverlayStateMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _overlayEntry;

  bool get isOverlayShown => _overlayEntry != null;

  void toggleOverlay(Widget child) =>
      isOverlayShown ? removeOverlay() : _insertOverlay(child);

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _dismissibleOverlay(Widget child) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: removeOverlay,
            ),
          ),
          child
        ],
      );

  void _insertOverlay(Widget child) {
    _overlayEntry = OverlayEntry(builder: (_) => _dismissibleOverlay(child));

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    removeOverlay();
    super.didChangeDependencies();
  }
}

import 'package:flutter/material.dart';

class WindowModel extends ChangeNotifier {
  String windowName;
  Image windowIcon;

  Offset _windowBottomRightMargin;
  Offset _windowTopLeftMargin;
  RelativeRect _initialPosition;
  RelativeRect _windowPosition;
  bool _canFullScreen = true;
  bool _isFullScreen = false;
  bool _isDraggable;
  bool _isMinimized = false;
  bool _withAnimation = true;

  WindowModel({
    required this.windowName,
    required this.windowIcon,
    required RelativeRect initialPosition,
    required bool canFullScreen,
    required bool isDraggable,
  })  : _initialPosition = initialPosition,
        _windowPosition = initialPosition,
        _windowBottomRightMargin =
            Offset(initialPosition.right, initialPosition.bottom),
        _windowTopLeftMargin =
            Offset(initialPosition.left, initialPosition.top),
        _canFullScreen = canFullScreen,
        _isDraggable = isDraggable;

  Offset get windowBottomRightMargin => _windowBottomRightMargin;

  set windowBottomRightMargin(Offset margin) {
    _windowBottomRightMargin = margin;
    _windowPosition = RelativeRect.fromLTRB(
        _windowPosition.left, _windowPosition.top, margin.dx, margin.dy);
    notifyListeners();
  }

  Offset get windowTopLeftMargin => _windowTopLeftMargin;

  set windowTopLeftMargin(Offset margin) {
    _windowTopLeftMargin = margin;
    _windowPosition = RelativeRect.fromLTRB(
        margin.dx, margin.dy, _windowPosition.right, _windowPosition.bottom);
    notifyListeners();
  }

  RelativeRect get windowPosition => _windowPosition;

  set windowPosition(RelativeRect rect) {
    _windowPosition = rect;
    notifyListeners();
  }

  RelativeRect get initialPosition => _initialPosition;

  set initialPosition(RelativeRect rect) {
    _initialPosition = rect;
    notifyListeners();
  }

  bool get isFullScreen => _isFullScreen;

  set isFullScreen(bool value) {
    _isFullScreen = value;
    notifyListeners();
  }

  bool get isMinimized => _isMinimized;

  set isMinimized(bool value) {
    _isMinimized = value;
    notifyListeners();
  }

  bool get canFullScreen => _canFullScreen;

  set canFullScreen(bool value) {
    _canFullScreen = value;
    notifyListeners();
  }

  bool get isDraggable => _isDraggable;

  set isDraggable(bool value) {
    _isDraggable = value;
    notifyListeners();
  }

  bool get hasAnimation => _withAnimation;

  set hasAnimation(bool value) {
    _withAnimation = value;
    notifyListeners();
  }

  void dragWindow(DraggableDetails details) {
    var right = _windowBottomRightMargin.dx -
        details.offset.dx +
        _windowTopLeftMargin.dx;
    var bottom = _windowBottomRightMargin.dy -
        details.offset.dy +
        _windowTopLeftMargin.dy;

    _initialPosition = RelativeRect.fromLTRB(
        details.offset.dx, details.offset.dy, right, bottom);
    _windowPosition = _initialPosition;
    _withAnimation = false;
    notifyListeners();
  }

  void fullScreenToggle() {
    _isFullScreen = !_isFullScreen;
    _isDraggable = (_isFullScreen) ? false : true;
    _windowPosition = (_isFullScreen) ? RelativeRect.fill : _initialPosition;
    _withAnimation = true;
    notifyListeners();
  }

  void minimizeToggle(BuildContext context) {
    var ruler = MediaQuery.of(context).size;

    _isMinimized = !_isMinimized;
    _isDraggable = (_isMinimized) ? false : true;
    _windowPosition = (_isMinimized)
        ? RelativeRect.fromLTRB(
            _initialPosition.left, ruler.height, _initialPosition.right, 0)
        : _initialPosition;
    _withAnimation = true;
    notifyListeners();
  }
}

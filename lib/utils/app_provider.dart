import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/application.dart';

class System32 extends ChangeNotifier {
  bool _isMenuActive = false;
  bool _isSoundOn = true;
  List<Widget> _openApplications = [];

  bool get isMenuActive => _isMenuActive;
  bool get isSoundOn => _isSoundOn;
  List<Widget> get openApplications => _openApplications;

  void openApplication(Widget application) {
    _openApplications.add(application);
    notifyListeners();
  }

  void closeApplication(Widget application) {
    _openApplications.removeWhere((element) => element == application);
    notifyListeners();
  }

  set openApplications(List<Widget> applications) {
    _openApplications = applications;
    notifyListeners();
  }

  set isMenuActive(bool value) {
    _isMenuActive = value;
    notifyListeners();
  }

  set isSoundOn(bool value) {
    _isSoundOn = value;
    notifyListeners();
  }
}

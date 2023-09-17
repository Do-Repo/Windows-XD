import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/application.dart';

class System32 extends ChangeNotifier {
  bool _isMenuActive = false;
  bool _isSoundOn = true;
  List<Application> _openApplications = [];

  bool get isMenuActive => _isMenuActive;
  bool get isSoundOn => _isSoundOn;
  List<Application> get openApplications => _openApplications;

  void openApplication(Application application) {
    _openApplications.add(application);
    notifyListeners();
  }

  void closeApplicationByName(String name) {
    _openApplications.removeWhere((element) => element.windowModel.windowName == name);
    notifyListeners();
  }

  set openApplications(List<Application> applications) {
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

import 'package:flutter/material.dart';

class ActiveApplication {
  String name;
  Widget application;
  Widget taskbarChild;

  ActiveApplication({
    required this.name,
    required this.application,
    required this.taskbarChild,
  });

  ActiveApplication copyWith({
    String? name,
    Widget? application,
    Widget? taskbarChild,
  }) {
    return ActiveApplication(
      name: name ?? this.name,
      application: application ?? this.application,
      taskbarChild: taskbarChild ?? this.taskbarChild,
    );
  }
}

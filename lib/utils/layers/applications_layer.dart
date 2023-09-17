import 'package:flutter/material.dart';

import 'package:my_portfolio/utils/app_provider.dart';

import 'package:provider/provider.dart';

class ApplicationLayer extends StatefulWidget {
  const ApplicationLayer({super.key});

  @override
  State<ApplicationLayer> createState() => _ApplicationLayerState();
}

class _ApplicationLayerState extends State<ApplicationLayer> {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<System32>(context);
    return Stack(
      children: app.openApplications.map((e) => e).toList(),
    );
  }
}

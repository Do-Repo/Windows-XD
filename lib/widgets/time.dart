import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_portfolio/utils/font_resource.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  late Timer t;
  late String time;

  @override
  void initState() {
    super.initState();
    time = DateFormat('hh:mm a').format(DateTime.now());
    t = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = DateFormat('hh:mm a').format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    t.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          time.toString(),
          style:
              FontResources().defaultStyleLarge.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

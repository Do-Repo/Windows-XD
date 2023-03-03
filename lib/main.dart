import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:my_portfolio/utils/app_provider.dart';
import 'package:my_portfolio/utils/layers/applications_layer.dart';

import 'package:my_portfolio/utils/layers/top_window_layer.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => System32()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Portfolio',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(
          children: [ApplicationLayer(), TopWindowLayer()],
        ));
  }
}

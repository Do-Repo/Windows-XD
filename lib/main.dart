import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/starting_screen.dart';
import 'package:my_portfolio/utils/app_provider.dart';

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
    return const MaterialApp(
      title: 'Windows XD',
      debugShowCheckedModeBanner: false,
      home: StartingScreen(skip: false),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_provider.dart';
import 'package:my_portfolio/windows/i_explorer.dart' deferred as app;

import 'package:provider/provider.dart';

import '../utils/image_resource.dart';
import '../widgets/sound_button.dart';
import '../widgets/taskbar.dart';
import '../widgets/time.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.children});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  final List<Widget> children;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   document.documentElement!.requestFullscreen();
    // });

    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await app.loadLibrary();
      if (context.mounted) {
        Provider.of<System32>(context, listen: false)
            .openApplication(app.InternetExplorer());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    ImageResources().backgroundPicture,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                    child: Stack(
                  children: widget.children,
                ))
              ],
            ),
          ),
          const TaskBar(
            taskbarItems: [],
            optionbarItems: [SoundButton(), TimeWidget()],
          )
        ],
      ),
    ));
  }
}

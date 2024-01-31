import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:my_portfolio/utils/image_resource.dart';
import 'package:my_portfolio/utils/layers/applications_layer.dart';
import 'package:my_portfolio/utils/layers/desktop_layer.dart';
import 'package:my_portfolio/utils/layers/top_window_layer.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key, this.skip});
  final bool? skip;
  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  late Timer t;
  AudioPlayer player = AudioPlayer();
  var counters = [0, 1, 2];
  var barsCount = 15;

  loadingAnimation() {
    for (var element in counters) {
      if (element < barsCount) {
        counters[counters.indexOf(element)]++;
      } else {
        counters[counters.indexOf(element)] = 0;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    player.setAudioSource(AudioSource.uri(Uri.parse('asset:///assets/sounds/windows-xp-startup.mp3')),
        initialPosition: Duration.zero, preload: true);

    t = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        loadingAnimation();
      });
    });

    Future.delayed(Duration(seconds: (widget.skip ?? false) ? 0 : 7), () {
      player.play().then((value) => player.dispose());

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const HomeScreen(
                children: [DesktopIconsLayer(), ApplicationLayer(), TopWindowLayer()],
              )));
    });
  }

  @override
  void dispose() {
    super.dispose();
    t.cancel();
  }

  double barsHorizontalPadding = 2;
  double barsVerticalPadding = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageResources().windowsLogo),
            Container(
              padding: EdgeInsets.symmetric(vertical: barsVerticalPadding),
              margin: const EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid, width: 2, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(17)),
                child: SizedBox(
                  height: 12,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: barsCount,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 10,
                          margin:
                              EdgeInsets.symmetric(horizontal: barsHorizontalPadding, vertical: barsVerticalPadding),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: (counters.contains(index))
                                      ? const [
                                          Color(0XFF2838c7),
                                          Color(0XFF5979ef),
                                          Color(0XFF869ef3),
                                          Color(0XFF869ef3),
                                          Color(0XFF5979ef),
                                          Color(0XFF2838c7)
                                        ]
                                      : [Colors.black, Colors.black])),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

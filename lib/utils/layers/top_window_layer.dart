import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:my_portfolio/utils/app_provider.dart';
import 'package:my_portfolio/widgets/start_menu.dart';
import 'package:provider/provider.dart';

class TopWindowLayer extends StatefulWidget {
  const TopWindowLayer({
    super.key,
  });

  @override
  State<TopWindowLayer> createState() => _TopWindowLayerState();
}

class _TopWindowLayerState extends State<TopWindowLayer> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<System32>(context, listen: true);
    return Stack(
      children: [
        if (app.isMenuActive) Positioned.fill(child: GestureDetector(onTap: () => app.isMenuActive = false)),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: app.isMenuActive ? 0 : -800,
            child: const StartMenu()),
        const Positioned(bottom: 10, right: 10, child: Clippy())
      ],
    );
  }
}

class Clippy extends StatefulWidget {
  const Clippy({super.key});

  @override
  State<Clippy> createState() => _ClippyState();
}

class _ClippyState extends State<Clippy> {
  GifController gifController = GifController(loop: false);
  String clippyState = "assets/images/clippygif.gif";
  int? nextMove;
  bool isFinished = false;

  @override
  void initState() {
    gifController = GifController(
      loop: false,
      onFinish: () => setState(() {
        isFinished = true;
      }),
      onFrame: (frame) async {
        if (frame == 29) {
          gifController.pause();
          await Future.delayed(const Duration(seconds: 6)).then((value) {
            handleClippyAnimation(nextMove ?? Random().nextInt(4) + 1);
          });
        }
        if (frame == 48) {
          gifController.pause();
          await Future.delayed(const Duration(seconds: 6)).then((value) {
            handleClippyAnimation(nextMove ?? Random().nextInt(4) + 1);
          });
        }
        if (frame == 55) {
          gifController.pause();
          await Future.delayed(const Duration(seconds: 6)).then((value) {
            handleClippyAnimation(nextMove ?? Random().nextInt(4) + 1);
          });
        }
        if (frame == 115) {
          gifController.pause();
          await Future.delayed(const Duration(seconds: 6)).then((value) {
            handleClippyAnimation(nextMove ?? Random().nextInt(4) + 1);
          });
        }
        if (frame == 139) {
          gifController.pause();
          await Future.delayed(const Duration(seconds: 6)).then((value) {
            handleClippyAnimation(nextMove ?? Random().nextInt(4) + 1);
          });
        }
      },
    );
    super.initState();
  }

  handleClippyAnimation(int animationIndex) {
    // Quit animation
    if (animationIndex == 0) {
      gifController.play(initialFrame: 140);
    }
    // AFK animations
    if (animationIndex == 1) {
      nextMove = null;
      gifController.play(initialFrame: 116);
    }
    if (animationIndex == 2) {
      nextMove = null;
      gifController.play(initialFrame: 56);
    }
    if (animationIndex == 3) {
      nextMove = null;
      gifController.play(initialFrame: 49);
    }
    if (animationIndex == 4) {
      nextMove = null;
      gifController.play(initialFrame: 30);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: (isFinished)
          ? Container()
          : GifView.asset(
              clippyState,
              withOpacityAnimation: false,
              fadeDuration: Duration.zero,
              controller: gifController,
            ),
    );
  }
}

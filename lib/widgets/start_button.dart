import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_provider.dart';
import 'package:my_portfolio/utils/image_resource.dart';
import 'package:my_portfolio/widgets/image_button.dart';
import 'package:provider/provider.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<System32>(context, listen: true);
    return XPImageButton(
      isActive: app.isMenuActive,
      onTap: () {
        app.isMenuActive = !app.isMenuActive;
      },
      enabledImage: ImageResources().startButton,
      activatedImage: ImageResources().startButtonActivated,
    );
  }
}

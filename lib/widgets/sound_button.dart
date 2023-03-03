import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_provider.dart';
import '../utils/image_resource.dart';
import 'toggle_button.dart';

class SoundButton extends StatefulWidget {
  const SoundButton({
    super.key,
  });

  @override
  State<SoundButton> createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<System32>(context, listen: true);
    return XPToggleButton(
      states: 2,
      stateImages: [ImageResources().soundOn, ImageResources().soundOff],
      currentState: app.isSoundOn ? 0 : 1,
      onTap: () => app.isSoundOn = !app.isSoundOn,
    );
  }
}

import 'package:flutter/material.dart';
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

class _TopWindowLayerState extends State<TopWindowLayer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<System32>(context, listen: true);
    return Stack(
      children: [
        if (app.isMenuActive)
          Positioned.fill(
              child: GestureDetector(onTap: () => app.isMenuActive = false)),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          bottom: app.isMenuActive ? 0 : -800,
          child: const StartMenu(),
        )
      ],
    );
  }
}

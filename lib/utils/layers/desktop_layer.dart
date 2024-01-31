import 'package:flutter/material.dart';
import 'package:my_portfolio/applications/internet_explorer.dart';
import 'package:my_portfolio/utils/app_provider.dart';
import 'package:my_portfolio/widgets/application.dart';
import 'package:provider/provider.dart';

class DesktopIconsLayer extends StatefulWidget {
  const DesktopIconsLayer({super.key});

  @override
  State<DesktopIconsLayer> createState() => _DesktopIconsLayerState();
}

class _DesktopIconsLayerState extends State<DesktopIconsLayer> {
  @override
  Widget build(BuildContext context) {
    return DesktopIcon(
      application: internetExplorer(),
    );
  }
}

class DesktopIcon extends StatefulWidget {
  const DesktopIcon({super.key, required this.application});
  final Application application;

  @override
  State<DesktopIcon> createState() => _DesktopIconState();
}

class _DesktopIconState extends State<DesktopIcon> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        isSelected = !isSelected;
      }),
      onDoubleTap: () {
        context.read<System32>().openApplication(widget.application);
      },
      child: Container(
        height: 100,
        width: 100,
        padding: const EdgeInsets.all(2),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.application.windowModel.desktopIcon,
              const SizedBox(height: 5),
              Flexible(
                child: Container(
                  color: isSelected ? const Color(0XFF16529A).withOpacity(0.8) : null,
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    widget.application.windowModel.windowName,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        overflow: TextOverflow.ellipsis,
                        shadows: [Shadow(offset: Offset(1, 1), blurRadius: 1)]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

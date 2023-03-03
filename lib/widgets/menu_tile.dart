import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_provider.dart';
import 'package:my_portfolio/utils/layers/menu_overlay.dart';
import 'package:provider/provider.dart';

import '../utils/font_resource.dart';

class MenuTile extends StatefulWidget {
  const MenuTile(
      {super.key,
      this.onTap,
      required this.image,
      required this.title,
      required this.hasOverlay,
      this.overlayChild,
      this.subtitle})
      : assert(hasOverlay ? overlayChild != null : overlayChild == null,
            "Overlay child is required when hasOverlay is true"),
        assert(hasOverlay ? onTap == null : onTap != null);

  final Function? onTap;
  final String image;
  final String title;
  final String? subtitle;
  final bool hasOverlay;
  final Widget? overlayChild;

  @override
  State<MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> with MenuOverlayStateMixin {
  late Image image;
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
    image = Image.asset(widget.image);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<System32>(context, listen: false);
    return InkWell(
      key: key,
      onTap: () {
        if (widget.hasOverlay) {
          RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
          Offset position = box.localToGlobal(Offset.zero);
          toggleOverlay(Positioned(
              left: box.size.width,
              top: position.dy,
              child: widget.overlayChild!));
        } else {
          app.isMenuActive = false;
          widget.onTap!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: image,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: FontResources().titleStyle),
                if (widget.subtitle != null)
                  Text(widget.subtitle!,
                      style: FontResources()
                          .subtitleStyle
                          .copyWith(color: Colors.grey))
              ],
            )
          ],
        ),
      ),
    );
  }
}

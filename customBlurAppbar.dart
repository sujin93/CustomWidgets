import 'dart:ui';
import 'package:flutter/material.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget title;
  final List<Widget> actions;

  const GlassAppBar({
    Key? key,
    required this.height,
    required this.title,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + MediaQuery.of(context).padding.top,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                //blendMode: BlendMode.luminosity,
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Container(
                    color: Colors.white.withOpacity(0.1),
                    // color: Colors.white.withOpacity(0.1),
                    ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                title,
                Spacer(),
                ...actions,
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

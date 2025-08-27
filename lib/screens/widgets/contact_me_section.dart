import 'dart:ui';

import 'package:flutter/material.dart';

class ContactMeSection extends StatelessWidget {
  final Size size;
  final bool effectEnabled;
  final Widget child;

  const ContactMeSection({
    super.key,
    required this.size,
    required this.child,
    this.effectEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = size.width;

    double containerWidth = screenWidth * 0.9;
    double maxContainerWidth = 800;
    double horizontalPadding = screenWidth < 600 ? 12 : 24;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              constraints: BoxConstraints(
                maxWidth: maxContainerWidth,
              ),
              width: containerWidth,
              // height: size.height * 0.42,
              padding: EdgeInsets.symmetric(
                  vertical: 24, horizontal: horizontalPadding),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: child
              //  Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Container(
              //       width: size.width < 900 ? size.width * 0.9 : 700,
              //       padding: const EdgeInsets.all(15),
              //       child: child,
              //     )
              //   ],
              // ),
              ),
        ),
      ),
    );
  }
}

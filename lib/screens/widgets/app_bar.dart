import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/constraints/colors.dart';
import 'package:portfolio/screens/widgets/text_widget.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar(
      {super.key, required this.onItemTap, required this.activeSection});

  final void Function(String section)? onItemTap;
  final String activeSection;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final List<bool> isHovering = [false, false, false, false];

  final List<String> menuItems = ['Home', 'About', 'Projects', 'Contact'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: size.width * 0.88,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(50),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2))),
            padding: const EdgeInsets.all(20),
            child: Row(
              spacing: 50,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                  sSize: size,
                  text: "My Portfolio </>",
                  size: 28,
                  color: AppColors.studio,
                  fw: FontWeight.bold,
                ),
                SizedBox(
                  width: 10,
                ),
                // const Spacer(),
                Row(
                  children: List.generate(menuItems.length, (index) {
                    return MouseRegion(
                      onEnter: (_) => setState(() => isHovering[index] = true),
                      onExit: (_) => setState(() => isHovering[index] = false),
                      child: GestureDetector(
                        onTap: () => widget.onItemTap
                            ?.call(menuItems[index].toLowerCase()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                menuItems[index],
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: widget.activeSection ==
                                            menuItems[index].toLowerCase()
                                        ? AppColors.studio
                                        : isHovering[index]
                                            ? AppColors.studio
                                            : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 2,
                                width: isHovering[index] ? 40 : 0,
                                color: AppColors.ebony,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

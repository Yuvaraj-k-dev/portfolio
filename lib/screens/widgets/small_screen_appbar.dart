import 'package:flutter/material.dart';
import 'package:portfolio/constraints/colors.dart';

class SmallScreenAppbar extends StatefulWidget {
  final void Function(String section) onItemTap;
  final String activeSection;

  const SmallScreenAppbar({
    super.key,
    required this.onItemTap,
    required this.activeSection,
  });

  @override
  State<SmallScreenAppbar> createState() => _SmallScreenAppbarState();
}

class _SmallScreenAppbarState extends State<SmallScreenAppbar> {
  final List<String> menuItems = ['Home', 'About', 'Projects', 'Contact'];
  final List<bool> isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: size.height,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(90),
          border: Border.all(color: Colors.white.withAlpha(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(menuItems.length, (index) {
              final item = menuItems[index];
              final isActive = widget.activeSection == item.toLowerCase();

              return MouseRegion(
                onEnter: (_) => setState(() => isHovering[index] = true),
                onExit: (_) => setState(() => isHovering[index] = false),
                child: GestureDetector(
                  onTap: () {
                    widget.onItemTap(item.toLowerCase());
                    Navigator.of(context).pop(); // close drawer
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isActive
                            ? AppColors.studio
                            : isHovering[index]
                                ? AppColors.studio
                                : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

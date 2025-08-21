import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constraints/colors.dart';
import 'package:portfolio/screens/widgets/text_widget.dart';

class MyServicesWidget extends StatefulWidget {
  final Size size;
  const MyServicesWidget({super.key, required this.size});

  @override
  State<MyServicesWidget> createState() => _MyServicesWidgetState();
}

class _MyServicesWidgetState extends State<MyServicesWidget> {
  late List<bool> _isHovered;

  @override
  void initState() {
    super.initState();
    _isHovered = List.generate(_services.length, (_) => false);
  }

  final List<Map<String, String>> _services = [
    {
      "title": "Cross-Platform App Development",
      "description":
          "Build high-performance, pixel-perfect mobile applications for both Android and iOS using Flutter. I focus on optimized UI, smooth animations, and fast load times to provide a seamless user experience across all devices.",
    },
    {
      "title": "Custom UI/UX Design",
      "description":
          "Create visually appealing and user-friendly interfaces. From wireframes to pixel-level custom designs, I translate ideas into beautiful layouts using Flutter's powerful widget system.",
    },
    {
      "title": "Backend Integration",
      "description":
          "Seamlessly integrate RESTful APIs and backend services into the frontend. Skilled at consuming APIs, handling authentication, and implementing real-time features using technologies like Firebase.",
    },
    {
      "title": "Performance Optimization & Clean Code",
      "description":
          "Ensure maintainable, scalable, and efficient code following best practices. I’m committed to delivering bug-free, high-quality code using tools like Provider or BLoC for state management.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double width = widget.size.width;

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _services.length,
        itemBuilder: (context, index) {
          bool iswide = width > 800;

          return MouseRegion(
            onEnter: (_) => setState(() => _isHovered[index] = true),
            onExit: (_) => setState(() => _isHovered[index] = false),
            child: AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                duration: Duration(milliseconds: 80),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(
                    horizontal: widget.size.width * 0.05, vertical: 16),
                width: widget.size.width,
                decoration: BoxDecoration(
                  color: _isHovered[index] ? null : Colors.transparent,
                  border: Border.all(
                    color: _isHovered[index]
                        ? AppColors.studio.withValues(alpha: 0.5)
                        : Colors.transparent, // TODO: ebony
                  ),
                  gradient: _isHovered[index]
                      ? LinearGradient(colors: [
                          AppColors.studio,
                          AppColors.ebony,
                        ])
                      : null,
                ),
                child: iswide
                    ? Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            sSize: widget.size,
                            text: "${index + 1}",
                            size: 28,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: widget.size.height * 0.04,
                          ),
                          SizedBox(
                            width: widget.size.width * 0.3,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextWidget(
                                sSize: widget.size,
                                text: _services[index]["title"]!,
                                size: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: widget.size.height * 0.08,
                          ),
                          Expanded(
                            flex: 4,
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: TextWidget(
                                  sSize: widget.size,
                                  text: _services[index]["description"]!,
                                  size: 16,
                                  color: Colors.white,
                                )),
                          ),
                          FaIcon(
                            _isHovered[index]
                                ? FontAwesomeIcons.arrowTrendUp
                                : FontAwesomeIcons.arrowTrendDown,
                            color: _isHovered[index]
                                ? Colors.white
                                : AppColors.studio,
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidget(
                            sSize: widget.size,
                            text: "${index + 1}",
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: widget.size.height * 0.02,
                          ),
                          TextWidget(
                            sSize: widget.size,
                            text: _services[index]["title"]!,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: widget.size.height * 0.04,
                          ),
                          Wrap(
                            direction: Axis.horizontal,
                            children: [
                              TextWidget(
                                alignment: TextAlign.center,
                                sSize: widget.size,
                                text: _services[index]["description"]!,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      )),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/constraints/colors.dart';
import 'package:portfolio/constraints/styles.dart';
import 'package:portfolio/screens/widgets/app_bar.dart';
import 'package:portfolio/screens/widgets/contact_details.dart';
import 'package:portfolio/screens/widgets/contact_form.dart';
import 'package:portfolio/screens/widgets/contact_me_section.dart';
import 'package:portfolio/screens/widgets/count_container_widget.dart';
import 'package:portfolio/screens/widgets/header_text_widget.dart';
import 'package:portfolio/screens/widgets/myservice_widgets.dart';
import 'package:portfolio/screens/widgets/rotating_image_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:portfolio/screens/widgets/custom_tabbar.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool effectEnabled = true;

  late ScrollController _scrollController;
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  String _activeSection = 'home';
  double _lastScrollOffset = 0.0;
  bool _isAppBarVisible = true;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double currentOffset = _scrollController.offset;

    // Toggle AppBar visibility based on scroll direction
    if (currentOffset > _lastScrollOffset && _isAppBarVisible) {
      setState(() => _isAppBarVisible = false);
    } else if (currentOffset < _lastScrollOffset && !_isAppBarVisible) {
      setState(() => _isAppBarVisible = true);
    }
    _lastScrollOffset = currentOffset;

    // Check visible section
    _updateActiveSection();
  }

  void _updateActiveSection() {
    final contextList = {
      'home': homeKey,
      'about': aboutKey,
      'projects': projectsKey,
      'contact': contactKey,
    };

    String currentSection = _activeSection;

    contextList.forEach((section, key) {
      final ctx = key.currentContext;
      if (ctx != null) {
        final RenderBox box = ctx.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero).dy;

        if (offset <= 150 && offset >= -box.size.height + 150) {
          currentSection = section;
        }
      }
    });

    if (currentSection != _activeSection) {
      setState(() {
        _activeSection = currentSection;
      });
    }
  }

  void scrollToSection(String section) {
    final contextMap = {
      'home': homeKey,
      'about': aboutKey,
      'projects': projectsKey,
      'contact': contactKey,
    };

    final key = contextMap[section];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _isAppBarVisible
          ? PreferredSize(
              preferredSize: Size(size.width, 130),
              child: CustomAppBar(
                onItemTap: scrollToSection,
                activeSection: _activeSection,
              ),
            )
          : null,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              KeyedSubtree(
                key: homeKey,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HeaderTextWidget(
                            size: size,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Social_large(size: size),
                        ],
                      ),
                      Expanded(
                          child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [RotatingImageContainer()],
                      ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CountWidget(
                      size: size,
                      text1: "1+",
                      text2: "Years of",
                      text3: "Experience",
                    ),
                    CountWidget(
                      size: size,
                      text1: "2+",
                      text2: "Projects",
                      text3: "Completed",
                    ),
                    // CountWidget(
                    //   size: size,
                    //   text1: "1.5K",
                    //   text2: "Happy",
                    //   text3: "Customers",
                    // ),
                    // CountWidget(
                    //   size: size,
                    //   text1: "1M",
                    //   text2: "Awesome",
                    //   text3: "Reviews",
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.12,
              ),
              KeyedSubtree(
                key: aboutKey,
                child: Container(
                  color: AppColors.ebony,
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                  child: Column(
                    children: [
                      GradientText(
                        "My Quality Services",
                        colors: const [
                          AppColors.studio,
                          AppColors.paleSlate,
                        ],
                        style: TextStyle(
                            fontSize: size.width * 0.030,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'We put your ideas and thus your wishes in the form of a unique app project that inspires you and your customers.',
                        style: TextStyle(
                            fontSize: size.width * 0.012,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      MyServicesWidget(size: size),
                    ],
                  ),
                ),
              ),
              KeyedSubtree(
                key: projectsKey,
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.05,
                      horizontal: size.width * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GradientTextWidget(
                        size: size,
                        text1: "My Recent Works",
                        fsize: 0.045,
                        fw: FontWeight.bold,
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      const CustomTabSection()
                    ],
                  ),
                ),
              ),
              KeyedSubtree(
                key: contactKey,
                child: Container(
                  color: AppColors.ebony,
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GradientTextWidget(
                        size: size,
                        text1: "Contact Me",
                        fsize: 0.045,
                        fw: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Have a question or want to work together? Fill out the form and I\'ll get back to you as soon as possible.',
                        style: TextStyle(
                            fontSize: size.width * 0.012,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 800,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ContactMeSection(
                              size: MediaQuery.of(context).size,
                              child: const ContactForm(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            const ContactDetails(),
                            const Divider(
                              indent: 1,
                              endIndent: 1,
                              color: AppColors.studio,
                              height: 30,
                              thickness: 1,
                            ),
                            Text(
                              '©2025-Yuvaraj K',
                              style: TextStyle(
                                  fontSize: size.width * 0.010,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
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

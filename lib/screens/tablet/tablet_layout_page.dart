import 'package:flutter/material.dart';
import 'package:portfolio/constraints/colors.dart';
import 'package:portfolio/constraints/styles.dart';
import 'package:portfolio/screens/widgets/contact_details.dart';
import 'package:portfolio/screens/widgets/contact_form.dart';
import 'package:portfolio/screens/widgets/contact_me_section.dart';
import 'package:portfolio/screens/widgets/count_container_widget.dart';
import 'package:portfolio/screens/widgets/custom_tabbar.dart';
import 'package:portfolio/screens/widgets/download_cv_widget.dart';
import 'package:portfolio/screens/widgets/header_text_widget.dart';
import 'package:portfolio/screens/widgets/myservice_widgets.dart';
import 'package:portfolio/screens/widgets/rotating_image_widget.dart';
import 'package:portfolio/screens/widgets/small_screen_appbar.dart';
import 'package:portfolio/screens/widgets/social_widget.dart';
import 'package:portfolio/screens/widgets/text_widget.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late ScrollController _scrollController;
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  String _activeSection = 'home';

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
    _updateActiveSection();
  }

  void _updateActiveSection() {
    final contextMap = {
      'home': homeKey,
      'about': aboutKey,
      'projects': projectsKey,
      'contact': contactKey,
    };

    for (var entry in contextMap.entries) {
      final key = entry.value;
      final section = entry.key;

      if (key.currentContext != null) {
        final RenderBox box =
            key.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);

        if (position.dy >= 0 &&
            position.dy < MediaQuery.of(context).size.height / 1.5) {
          if (_activeSection != section) {
            setState(() {
              _activeSection = section;
            });
          }
          break;
        }
      }
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: TextWidget(
          sSize: size,
          text: "My Portfolio </>",
          size: 28,
          color: AppColors.studio,
          fw: FontWeight.bold,
        ),
      ),
      drawer: SmallScreenAppbar(
        activeSection: _activeSection,
        onItemTap: scrollToSection,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.18),
            child: KeyedSubtree(
              key: homeKey,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [RotatingImageContainer()],
                          ),
                          SizedBox(
                            height: size.width * 0.09,
                          ),
                          Row(
                            children: [
                              HeaderTextWidget(
                                size: size,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Social_Tab(size: size)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CountWidget(
                          size: size,
                          text1: "1+",
                          text2: "Years of",
                          text3: "Experience",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: AppColors.paleSlate,
                          indent: size.width * 0.05,
                          endIndent: size.width * 0.05,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CountWidget(
                          size: size,
                          text1: "2+",
                          text2: "Projects",
                          text3: "Completed",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: AppColors.paleSlate,
                          indent: size.width * 0.05,
                          endIndent: size.width * 0.05,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // CountWidget(
                        //   size: size,
                        //   text1: "1.5K",
                        //   text2: "Happy",
                        //   text3: "Customers",
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Divider(
                        //   color: AppColors.paleSlate,
                        //   indent: size.width * 0.05,
                        //   endIndent: size.width * 0.05,
                        // ),
                        // const SizedBox(
                        //   height: 20,
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
                  KeyedSubtree(
                      key: aboutKey, child: MyServicesWidget(size: size)),
                  KeyedSubtree(
                    key: projectsKey,
                    child: Container(
                      width: size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: size.width * 0.03),
                      child: Column(
                        children: [
                          GradientTextWidget(
                            size: size,
                            text1: "My Recent Works",
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          CustomTabSection()
                        ],
                      ),
                    ),
                  ),
                  KeyedSubtree(
                    key: contactKey,
                    child: Container(
                      // color: AppColors.ebony,
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                          vertical: size.width * 0.05, horizontal: 16),
                      child: Column(
                        children: [
                          GradientTextWidget(
                            size: size,
                            text1: "Contact Me",
                            fsize: 0.045,
                            fw: FontWeight.bold,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Have a question or want to work together? Fill out the form and I\'ll get back to you.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width * 0.025,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ContactMeSection(
                              size: size, child: const ContactForm()),
                          const SizedBox(height: 20),
                          const ContactDetails(),
                          const Divider(color: AppColors.studio, thickness: 1),
                          Text(
                            '©2025-Yuvaraj K',
                            style: TextStyle(
                              fontSize: size.width * 0.02,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Social_Tab extends StatelessWidget {
  const Social_Tab({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DownloadCVButton(),
          SizedBox(
            height: 20,
          ),
          SocialWidget(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

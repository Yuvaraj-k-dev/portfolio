import 'package:flutter/material.dart';
import 'package:portfolio/constraints/colors.dart';
import 'package:portfolio/screens/widgets/download_cv_widget.dart';
//import 'package:portfolio/screens/widgets/social_section.dart';
import 'package:portfolio/screens/widgets/social_widget.dart';
import 'package:portfolio/screens/widgets/text_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HeaderTextWidget extends StatelessWidget {
  final Size size;
  const HeaderTextWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.07,
      ),
      child: Column(
        crossAxisAlignment: size.width > 600
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              child: TextWidget(
            sSize: size,
            text: "I am Yuvaraj",
            color: Colors.white,
            size: 26,
            fw: FontWeight.bold,
            alignment: TextAlign.center,
          )),
          GradientTextWidget(
            size: size,
            alignment: TextAlign.center,
            text1: "Flutter Developer",
            text2: "Frontend Designer",
          ),
          SizedBox(
            width: size.width * 0.5,
            child: TextWidget(
                sSize: size,
                alignment: TextAlign.center,
                text:
                    "I am a passionate Flutter app developer with experience in creating responsive, user-friendly, and performant mobile applications for Android and iOS. With a strong foundation in Dart programming and cross-platform development, I strive to deliver seamless experiences that meet user needs and business goals.",
                size: 16,
                color: Colors.white,
                fw: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class GradientTextWidget extends StatelessWidget {
  final TextAlign? alignment;
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  final double? fsize;
  final FontWeight? fw;
  const GradientTextWidget(
      {super.key,
      required this.size,
      this.alignment,
      this.fw,
      this.color1,
      this.text1,
      this.text2,
      this.color2,
      this.fsize});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final String fullText =
        text2 != null && text2!.isNotEmpty ? "$text1\n$text2" : "$text1";

    return GradientText(
      textAlign: size.width < 600 && alignment != null ? alignment : null,
      fullText,
      colors: const [
        AppColors.studio,
        AppColors.paleSlate,
      ],
      style: TextStyle(
          fontSize: size.width * 0.040,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold),
    );
  }
}

class Social_large extends StatelessWidget {
  const Social_large({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      child: const Row(
        children: [
          DownloadCVButton(),
          SizedBox(
            width: 20,
          ),
          SocialWidget()
        ],
      ),
    );
  }
}

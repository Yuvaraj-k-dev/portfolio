import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constraints/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border:
                  Border.all(color: AppColors.studio.withValues(alpha: 0.5))),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () => _launchURL(
                  'https://www.linkedin.com/in/-yuvaraj-k?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'),
              icon: const FaIcon(
                FontAwesomeIcons.linkedinIn,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border:
                  Border.all(color: AppColors.studio.withValues(alpha: 0.5))),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () => _launchURL(
                  'https://www.instagram.com/____yuvaraj____ys?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw=='),
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border:
                  Border.all(color: AppColors.studio.withValues(alpha: 0.5))),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () =>
                  _launchURL('https://www.facebook.com/share/16ZxRcWr7T/'),
              icon: const FaIcon(
                FontAwesomeIcons.facebook,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border:
                  Border.all(color: AppColors.studio.withValues(alpha: 0.5))),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () => _launchURL('https://github.com/Yuvaraj2244'),
              icon: const FaIcon(
                FontAwesomeIcons.github,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

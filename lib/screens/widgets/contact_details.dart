import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constraints/colors.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactItem(
            icon: FontAwesomeIcons.mapPin,
            text: 'Bangalore, Karnataka, India',
          ),
          SizedBox(height: 20),
          ContactItem(
            icon: FontAwesomeIcons.envelope,
            text: 'yuvarajkkpavan@gmail.com',
          ),
          SizedBox(height: 20),
          ContactItem(
            icon: FontAwesomeIcons.phone,
            text: '+91 99005 76550',
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.studio.withValues(alpha: 0.5),
            ),
          ),
          child: FaIcon(
            icon,
            color: AppColors.studio,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

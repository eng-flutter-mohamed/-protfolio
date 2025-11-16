import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_extensions.dart';

import 'contact_form.dart';
import 'contact_intro.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = context.width > DeviceType.ipad.getMaxWidth();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.cardColor.withOpacity(.95),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.borderColor.withOpacity(.5)),
        ),
        child: isDesktop
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ContactIntro()),
                  SizedBox(width: 32),
                  Expanded(child: ContactForm()),
                ],
              )
            : const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ContactIntro(),
                  SizedBox(height: 32),
                  ContactForm(),
                ],
              ),
      ),
    );
  }
}

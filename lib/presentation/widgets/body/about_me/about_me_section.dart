import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import 'about_me_intro.dart';
import 'detailed_services_section.dart';
import 'experience_info.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.width < DeviceType.ipad.getMaxWidth();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Container(
        padding: EdgeInsets.all(isMobile ? 24 : 36),
        decoration: BoxDecoration(
          color: AppColors.cardColor.withOpacity(.9),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.borderColor.withOpacity(.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isMobile
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutMeIntro(),
                      SizedBox(height: 24),
                      ExperienceInfo(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: AboutMeIntro()),
                      SizedBox(width: 40),
                      Expanded(child: ExperienceInfo()),
                    ],
                  ),
            const SizedBox(height: 48),
            const DetailedServicesSection(),
          ],
        ),
      ),
    );
  }
}

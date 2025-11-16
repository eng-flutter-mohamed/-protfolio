import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

class ExperienceInfo extends StatelessWidget {
  const ExperienceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.width < DeviceType.mobile.getMaxWidth();
    final textStyle = _getExpMsgStyle(context.width);
    final skills = [
      'Flutter',
      'GetX / Bloc',
      'Animations',
      'Clean Architecture',
      'CI / CD',
      'Mentorship',
    ];
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryLight.withOpacity(.6),
            AppColors.cardColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppColors.borderColor.withOpacity(.6)),
      ),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.numOfExperience.tr,
            style: context.width < DeviceType.mobile.getMaxWidth()
                ? AppStyles.s32.copyWith(fontSize: 48)
                : AppStyles.s32.copyWith(fontSize: 80),
          ),
          const SizedBox(height: 6),
          Text(
            AppStrings.highlightExperience.tr,
            style: AppStyles.s18.copyWith(color: AppColors.white),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.experienceMsg.tr,
            style: textStyle,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: skills
                .map(
                  (skill) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withOpacity(.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.primaryColor.withOpacity(.4),
                      ),
                    ),
                    child: Text(
                      skill,
                      style: AppStyles.s14,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  _getExpMsgStyle(double deviceWidth) {
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return AppStyles.s16.copyWith(fontWeight: FontWeight.w500);
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return AppStyles.s18;
    } else {
      return AppStyles.s24.copyWith(fontWeight: FontWeight.w500);
    }
  }
}

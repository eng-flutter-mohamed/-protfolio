import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../controllers/portfolio_controller.dart';

class IntoActions extends StatelessWidget {
  const IntoActions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PortfolioController.to;
    List<Widget> actions = [
      CustomButton(
        label: AppStrings.aboutAction.tr,
        icon: Icons.person,
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          controller.requestSectionNavigation(1);
        },
        width: 160,
      ),
      context.width < DeviceType.ipad.getMaxWidth()
          ? const SizedBox(height: 6)
          : const SizedBox(width: 32),
      CustomButton(
        label: AppStrings.seeProjects.tr,
        icon: Icons.remove_red_eye,
        borderColor: AppColors.primaryColor,
        onPressed: () {
          controller.requestSectionNavigation(2);
        },
        width: 160,
      ),
    ];
    return context.width < DeviceType.ipad.getMaxWidth()
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: actions,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: actions,
          );
  }
}

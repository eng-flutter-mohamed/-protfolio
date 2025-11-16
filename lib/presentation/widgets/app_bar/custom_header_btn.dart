import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_styles.dart';
import '../../controllers/portfolio_controller.dart';

class CustomHeaderBtn extends StatelessWidget {
  const CustomHeaderBtn({super.key, required this.headerIndex});

  final int headerIndex;

  @override
  Widget build(BuildContext context) {
    final controller = PortfolioController.to;
    return Obx(
      () {
        final isActive = controller.headerIndex.value == headerIndex;
        return TextButton(
          onPressed: () => controller.requestSectionNavigation(headerIndex),
          style: TextButton.styleFrom(
            textStyle: AppStyles.s16,
            foregroundColor:
                isActive ? AppColors.primaryColor : AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 26,
            ),
            child: Text(AppBarHeaders.values[headerIndex].label),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../controllers/portfolio_controller.dart';

class CustomMenuBtn extends StatelessWidget {
  const CustomMenuBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PortfolioController.to;
    return Obx(
      () => SizedBox(
        width: 40,
        child: AnimatedCrossFade(
          crossFadeState:
              controller.headersAxis.value == AppBarHeadersAxis.horizontal
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          firstChild: TextButton(
            onPressed: () =>
                controller.setHeadersAxis(AppBarHeadersAxis.vertical),
            style: TextButton.styleFrom(foregroundColor: AppColors.white),
            child: const Icon(Icons.menu),
          ),
          secondChild: TextButton(
            onPressed: () =>
                controller.setHeadersAxis(AppBarHeadersAxis.horizontal),
            style: TextButton.styleFrom(foregroundColor: AppColors.white),
            child: const Icon(Icons.close),
          ),
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}

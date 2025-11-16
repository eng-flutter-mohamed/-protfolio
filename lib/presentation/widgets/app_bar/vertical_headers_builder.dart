import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../controllers/portfolio_controller.dart';
import 'vertical_headers.dart';

class VerticalHeadersBuilder extends StatelessWidget {
  const VerticalHeadersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PortfolioController.to;
    return Obx(
      () => AnimatedCrossFade(
        sizeCurve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        crossFadeState:
            controller.headersAxis.value == AppBarHeadersAxis.horizontal
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
        firstChild: Container(
          color: AppColors.appBarColor,
          child: const VerticalHeaders(),
        ),
        secondChild: const SizedBox.shrink(),
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}

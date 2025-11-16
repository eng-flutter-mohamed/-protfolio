import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import 'intro_circle_image_box.dart';
import 'intro_text.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.width < DeviceType.ipad.getMaxWidth();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * .08),
      child: Container(
        padding: EdgeInsets.all(isMobile ? 24 : 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientStart, AppColors.gradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.borderColor.withOpacity(.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.35),
              blurRadius: 35,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: isMobile
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntroCircleImageBox(),
                  SizedBox(height: 40),
                  IntroText(),
                ],
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: IntroText()),
                  SizedBox(width: 40),
                  Expanded(child: IntroCircleImageBox()),
                ],
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:universal_html/html.dart' as html;

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/responsive.dart';

class DeveloperNameBtn extends StatelessWidget {
  const DeveloperNameBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double fontSize = _getFontSize(width);

    return InkWell(
      onTap: () {
        html.window.location.reload();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Text(
          AppStrings.developerName.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  double _getFontSize(double width) {
    if (Responsive.isDesktop(width)) return 36;
    if (Responsive.isTablet(width)) return 30;
    return 22;
  }
}

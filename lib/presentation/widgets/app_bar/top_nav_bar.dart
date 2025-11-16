import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/responsive.dart';
import 'custom_menu_btn.dart';
import 'developer_name_btn.dart';
import 'horizontal_headers.dart';
import 'language_toggle.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double horizontalPadding =
        Responsive.horizontalPadding(width).clamp(16, 160).toDouble();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.appBarColor.withOpacity(.9),
        borderRadius: BorderRadius.circular(AppConstants.appBarHeight / 2),
        border: Border.all(color: AppColors.borderColor.withOpacity(.35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: const [
          Flexible(
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: DeveloperNameBtn(),
            ),
          ),
          SizedBox(width: 16),
          Flexible(
            fit: FlexFit.tight,
            child: _TrailingZone(),
          ),
        ],
      ),
    );
  }
}

class _TrailingZone extends StatelessWidget {
  const _TrailingZone();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool showDesktopMenu = width > DeviceType.ipad.getMaxWidth();
    final bool showLanguageToggle = width > 360;

    final trailingChildren = <Widget>[];
    if (showDesktopMenu) trailingChildren.add(const HorizontalHeaders());
    if (showLanguageToggle) trailingChildren.add(const LanguageToggle());
    if (!showDesktopMenu) trailingChildren.add(const CustomMenuBtn());

    final bool forceWrap = width < 620;

    final Widget trailingWidget = trailingChildren.isEmpty
        ? const SizedBox()
        : forceWrap
            ? Wrap(
                spacing: 12,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.end,
                children: trailingChildren,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < trailingChildren.length; i++) ...[
                    if (i != 0) const SizedBox(width: 12),
                    trailingChildren[i],
                  ]
                ],
              );

    return Align(
      alignment: Alignment.centerRight,
      child: trailingWidget,
    );
  }
}

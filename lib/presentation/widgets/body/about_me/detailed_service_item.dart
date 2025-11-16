import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/models/custom_service.dart';

class DetailedServiceItem extends StatefulWidget {
  const DetailedServiceItem({super.key, required this.service});

  final CustomService service;

  @override
  State<DetailedServiceItem> createState() => _DetailedServiceItemState();
}

class _DetailedServiceItemState extends State<DetailedServiceItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bool showDescription =
        context.width > DeviceType.mobile.getMinWidth();
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isCompact = constraints.maxHeight < 220;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.cardColor.withOpacity(.85),
              border: Border.all(
                color: _hovered
                    ? AppColors.primaryColor
                    : AppColors.borderColor.withOpacity(.4),
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(.25),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SvgPicture.asset(
                    widget.service.logo,
                    height: context.width < DeviceType.mobile.getMinWidth()
                        ? 36
                        : 48,
                    colorFilter: ColorFilter.mode(
                      _hovered ? AppColors.white : AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.service.titleKey.tr,
                  style: (isCompact ? AppStyles.s18 : AppStyles.s24).copyWith(
                    color: _hovered ? AppColors.white : AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (showDescription) ...[
                  const SizedBox(height: 12),
                  Expanded(
                    child: AutoSizeText(
                      widget.service.descriptionKey.tr,
                      style: AppStyles.s17,
                      minFontSize: isCompact ? 8 : 10,
                      maxLines: isCompact ? 4 : 6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  void _setHover(bool hovered) {
    if (_hovered == hovered) return;
    setState(() => _hovered = hovered);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import 'intro_actions.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.width < DeviceType.mobile.getMaxWidth();
    final double textWidth =
        isMobile ? context.width - 20 : context.width / 2.1;
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isMobile ? Alignment.center : Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.cardColor.withOpacity(.7),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: AppColors.borderColor.withOpacity(.6)),
            ),
            child: Text(
              AppStrings.heroStatus.tr,
              style: AppStyles.s14.copyWith(color: AppColors.accentColor),
            ),
          ),
        ),
        const SizedBox(height: 18),
        RichText(
          textAlign: _getTextAlign(context.width),
          text: TextSpan(
            text: '${AppStrings.helloIM.tr} ',
            style: AppStyles.s18.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.lowPriority,
            ),
            children: [
              TextSpan(
                text: AppStrings.developerName.tr,
                style: isMobile ? AppStyles.s32 : AppStyles.s52,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          AppStrings.heroRole.tr,
          style: AppStyles.s28,
          textAlign: _getTextAlign(context.width),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: textWidth,
          child: Text(
            AppStrings.introMsg.tr,
            style: isMobile ? AppStyles.s14 : AppStyles.s18,
            textAlign: _getTextAlign(context.width),
            softWrap: true,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: textWidth,
          child: Text(
            AppStrings.heroFocus.tr,
            style: AppStyles.s14,
            textAlign: _getTextAlign(context.width),
          ),
        ),
        const SizedBox(height: 24),
        _Highlights(isMobile: isMobile),
        const SizedBox(height: 32),
        const IntoActions(),
      ],
    );
  }

  _getTextAlign(double screenWidth) {
    return screenWidth < DeviceType.mobile.getMaxWidth()
        ? TextAlign.center
        : TextAlign.start;
  }
}

class _Highlights extends StatelessWidget {
  const _Highlights({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final highlights = [
      _HighlightData(
        value: AppStrings.numOfExperience.tr,
        label: AppStrings.highlightExperience.tr,
      ),
      _HighlightData(value: '18+', label: AppStrings.highlightApps.tr),
      _HighlightData(value: '12+', label: AppStrings.highlightClients.tr),
      _HighlightData(value: '08+', label: AppStrings.highlightMentorship.tr),
    ];
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: highlights
          .map(
            (item) => _HighlightChip(
              value: item.value,
              label: item.label,
              isCompact: isMobile,
            ),
          )
          .toList(),
    );
  }
}

class _HighlightData {
  const _HighlightData({required this.value, required this.label});
  final String value;
  final String label;
}

class _HighlightChip extends StatefulWidget {
  const _HighlightChip({
    required this.value,
    required this.label,
    required this.isCompact,
  });
  final String value;
  final String label;
  final bool isCompact;

  @override
  State<_HighlightChip> createState() => _HighlightChipState();
}

class _HighlightChipState extends State<_HighlightChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: widget.isCompact ? 18 : 22,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _hovered
              ? AppColors.primaryLight.withOpacity(.8)
              : AppColors.cardColor.withOpacity(.6),
          border: Border.all(
            color: _hovered
                ? AppColors.primaryColor
                : AppColors.borderColor.withOpacity(.5),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(.35),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: widget.isCompact
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              widget.value,
              style: AppStyles.s28,
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: widget.isCompact ? 120 : 140,
              child: Text(
                widget.label,
                style: AppStyles.s14,
                textAlign:
                    widget.isCompact ? TextAlign.center : TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setHover(bool hovered) {
    if (_hovered == hovered) return;
    setState(() => _hovered = hovered);
  }
}

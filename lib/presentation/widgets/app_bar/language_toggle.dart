import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../controllers/portfolio_controller.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PortfolioController.to;
    return Obx(
      () {
        final code = controller.locale.value.languageCode;
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.cardColor.withOpacity(.6),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.borderColor.withOpacity(.6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LanguageChip(
                label: 'EN',
                isActive: code == 'en',
                onTap: () => controller.changeLocale(const Locale('en', 'US')),
              ),
              _LanguageChip(
                label: 'AR',
                isActive: code == 'ar',
                onTap: () => controller.changeLocale(const Locale('ar', 'EG')),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        gradient: isActive
            ? LinearGradient(
                colors: [AppColors.primaryColor, AppColors.secondaryColor],
              )
            : null,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.white : AppColors.lowPriority,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

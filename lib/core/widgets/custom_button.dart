import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.height,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.onPressed,
    this.width,
  });

  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? height;
  final IconData? icon;
  final String label;
  final double? width;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final gradient = widget.backgroundColor != null
        ? LinearGradient(
            colors: [
              widget.backgroundColor!,
              AppColors.secondaryColor,
            ],
          )
        : null;
    final borderColor = widget.borderColor ?? AppColors.primaryColor;

    return MouseRegion(
      onEnter: (_) => _toggleHover(true),
      onExit: (_) => _toggleHover(false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1,
        duration: const Duration(milliseconds: 200),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: widget.onPressed,
            child: Container(
              height: widget.height ?? 48,
              width: widget.width,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                gradient: gradient,
                color: gradient == null ? Colors.transparent : null,
                borderRadius: BorderRadius.circular(40),
                border: gradient == null
                    ? Border.all(color: borderColor.withOpacity(.6))
                    : null,
                boxShadow: _isHovered && gradient != null
                    ? [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(.4),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      widget.label,
                      style: AppStyles.s16,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      maxLines: 1,
                    ),
                  ),
                  if (widget.icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(
                      widget.icon,
                      size: 18,
                      color: AppColors.white,
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleHover(bool value) {
    if (_isHovered == value) return;
    setState(() => _isHovered = value);
  }
}

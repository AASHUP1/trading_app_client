import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

enum BoldButtonVariant { primary, secondary, danger, outlined }

class BoldButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final BoldButtonVariant variant;
  final bool isLoading;
  final IconData? icon;

  const BoldButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = BoldButtonVariant.primary,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    BorderSide? border;

    switch (variant) {
      case BoldButtonVariant.primary:
        bg = AppColors.primaryBullish;
        fg = Colors.black;
        break;
      case BoldButtonVariant.secondary:
        bg = AppColors.elevatedSurface;
        fg = AppColors.primaryText;
        break;
      case BoldButtonVariant.danger:
        bg = AppColors.bearishLoss;
        fg = Colors.white;
        break;
      case BoldButtonVariant.outlined:
        bg = Colors.transparent;
        fg = AppColors.primaryBullish;
        border = const BorderSide(color: AppColors.primaryBullish, width: 1);
        break;
    }

    return SizedBox(
      height: 48, // Minimum 48 dp interactive target (Section 2 SOP)
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 0,
          side: border,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(fg),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18, color: fg),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: AppTypography.titleMedium.copyWith(
                      color: fg,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

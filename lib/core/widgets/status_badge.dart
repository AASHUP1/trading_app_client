import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const StatusBadge({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  factory StatusBadge.bullish(String label) => StatusBadge(label: label, color: AppColors.primaryBullish, icon: Icons.arrow_upward);
  factory StatusBadge.bearish(String label) => StatusBadge(label: label, color: AppColors.bearishLoss, icon: Icons.arrow_downward);
  factory StatusBadge.warning(String label) => StatusBadge(label: label, color: AppColors.warning, icon: Icons.warning_amber_rounded);
  factory StatusBadge.neutral(String label) => StatusBadge(label: label, color: AppColors.secondaryText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

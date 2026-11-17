import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BoldCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool elevated;

  const BoldCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.elevated = false,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidget = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: elevated ? AppColors.elevatedSurface : AppColors.surface,
        borderRadius: BorderRadius.circular(12), // 12-16 dp card radius (Section 2 SOP)
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: cardWidget,
      );
    }
    return cardWidget;
  }
}

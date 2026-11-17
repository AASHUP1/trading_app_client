import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_button.dart';

/// S01 — Splash and Onboarding
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.primaryBullish.withOpacity(0.4), width: 1.5),
                    ),
                    child: const Center(
                      child: Text(
                        'B',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryBullish,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('BOLD', style: AppTypography.displayLarge),
                  const SizedBox(height: 8),
                  Text(
                    'INSTITUTIONAL EQUITIES & DERIVATIVES',
                    style: AppTypography.labelSmall.copyWith(
                      letterSpacing: 1.5,
                      color: AppColors.primaryBullish,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Real-time Indian markets, algo research, and simulated paper execution.',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.shield_outlined, size: 20, color: AppColors.warning),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Paper Trading Only: Initial release operates in simulated mode without live broker order placement.',
                            style: AppTypography.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BoldButton(
                    text: 'Get Started',
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                  const SizedBox(height: 12),
                  BoldButton(
                    text: 'I already have an account',
                    variant: BoldButtonVariant.secondary,
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

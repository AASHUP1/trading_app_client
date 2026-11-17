import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_button.dart';
import '../../../../core/widgets/bold_card.dart';

/// S03 — Workspace Personalization and Risk Profile
class PersonalizationScreen extends StatefulWidget {
  const PersonalizationScreen({super.key});

  @override
  State<PersonalizationScreen> createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends State<PersonalizationScreen> {
  String _selectedCapital = '10,00,000';
  String _selectedDensity = 'Intermediate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workspace Setup')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Configure Your Terminal', style: AppTypography.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Customize your virtual capital and workspace density.',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(height: 24),
              Text('Virtual Paper Capital', style: AppTypography.titleMedium),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildOptionCard('₹1,00,000', _selectedCapital == '1,00,000', () {
                      setState(() => _selectedCapital = '1,00,000');
                    }),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildOptionCard('₹10,00,000', _selectedCapital == '10,00,000', () {
                      setState(() => _selectedCapital = '10,00,000');
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('UI Density', style: AppTypography.titleMedium),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildOptionCard('Standard', _selectedDensity == 'Standard', () {
                      setState(() => _selectedDensity = 'Standard');
                    }),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildOptionCard('Intermediate', _selectedDensity == 'Intermediate', () {
                      setState(() => _selectedDensity = 'Intermediate');
                    }),
                  ),
                ],
              ),
              const Spacer(),
              BoldButton(
                text: 'Launch Workspace',
                onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(String title, bool isSelected, VoidCallback onTap) {
    return BoldCard(
      elevated: isSelected,
      onTap: onTap,
      child: Center(
        child: Text(
          title,
          style: AppTypography.titleMedium.copyWith(
            color: isSelected ? AppColors.primaryBullish : AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}

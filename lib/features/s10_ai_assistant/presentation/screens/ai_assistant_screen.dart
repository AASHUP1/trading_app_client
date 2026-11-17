import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';

/// S10 — AI Research Assistant
class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Market Assistant')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildMessage(
                  isUser: false,
                  text: 'Welcome to BOLD AI Research. Ask any question regarding Indian earnings, macroeconomic trends, or technical setups.',
                ),
                _buildMessage(
                  isUser: true,
                  text: 'Analyze RELIANCE Q1 performance and technical setup for 15m breakout.',
                ),
                _buildMessage(
                  isUser: false,
                  text: 'RELIANCE reported 8.4% YoY EBITDA growth led by Retail & Jio. Technically, the stock is consolidating in a ₹2,940 - ₹2,985 range with VWAP at ₹2,965.\n\nBull Scenario: Breakout above ₹2,985 opens path to ₹3,020.\nBear Scenario: Failure below ₹2,940 targets ₹2,900 support.\nSource: NSE Corporate Filings (Verified).',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: AppColors.surface,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ask financial AI assistant...',
                      hintStyle: AppTypography.bodySmall,
                      filled: true,
                      fillColor: AppColors.elevatedSurface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: AppColors.primaryBullish),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage({required bool isUser, required String text}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        constraints: const BoxConstraints(maxWidth: 320),
        child: BoldCard(
          elevated: !isUser,
          padding: const EdgeInsets.all(12),
          child: Text(text, style: AppTypography.bodyMedium),
        ),
      ),
    );
  }
}

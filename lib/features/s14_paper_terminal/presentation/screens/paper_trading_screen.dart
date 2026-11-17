import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_button.dart';
import '../../../../core/widgets/bold_card.dart';

/// S14 — Paper Trading Terminal & Order Ticket
class PaperTradingScreen extends StatefulWidget {
  const PaperTradingScreen({super.key});

  @override
  State<PaperTradingScreen> createState() => _PaperTradingScreenState();
}

class _PaperTradingScreenState extends State<PaperTradingScreen> {
  bool _isBuy = true;
  String _orderType = 'MARKET';
  final _qtyController = TextEditingController(text: '50');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simulated Paper Order')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Side Selector (BUY / SELL)
            Row(
              children: [
                Expanded(
                  child: BoldButton(
                    text: 'BUY (LONG)',
                    variant: _isBuy ? BoldButtonVariant.primary : BoldButtonVariant.secondary,
                    onPressed: () => setState(() => _isBuy = true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: BoldButton(
                    text: 'SELL (SHORT)',
                    variant: !_isBuy ? BoldButtonVariant.danger : BoldButtonVariant.secondary,
                    onPressed: () => setState(() => _isBuy = false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BoldCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('RELIANCE · NSE', style: AppTypography.titleMedium),
                      Text('LTP: ₹2,980.50', style: AppTypography.tabularFigures),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _qtyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantity (Shares)',
                      filled: true,
                      fillColor: AppColors.elevatedSurface,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ChoiceChip(
                          label: const Center(child: Text('MARKET')),
                          selected: _orderType == 'MARKET',
                          onSelected: (_) => setState(() => _orderType = 'MARKET'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ChoiceChip(
                          label: const Center(child: Text('LIMIT')),
                          selected: _orderType == 'LIMIT',
                          onSelected: (_) => setState(() => _orderType = 'LIMIT'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BoldCard(
              child: Column(
                children: [
                  _buildSummaryRow('Simulated Margin Required', '₹1,49,025.00'),
                  const Divider(),
                  _buildSummaryRow('Available Virtual Cash', '₹8,45,000.00'),
                  const Divider(),
                  _buildSummaryRow('Estimated Brokerage & Taxes', '₹42.50'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            BoldButton(
              text: _isBuy ? 'Submit Paper BUY Order' : 'Submit Paper SELL Order',
              variant: _isBuy ? BoldButtonVariant.primary : BoldButtonVariant.danger,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Simulated Paper Order Executed Successfully!'),
                    backgroundColor: AppColors.primaryBullish,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTypography.bodySmall),
          Text(val, style: AppTypography.tabularFigures.copyWith(fontSize: 13)),
        ],
      ),
    );
  }
}

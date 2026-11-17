import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_button.dart';

/// S02 — Login and Account Security
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController(text: '+91 98765 43210');
  final _otpController = TextEditingController();
  bool _otpSent = false;
  bool _isLoading = false;

  void _handleSendOtp() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _isLoading = false;
        _otpSent = true;
      });
    });
  }

  void _handleVerifyOtp() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, '/personalization');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _otpSent ? 'Enter 6-Digit OTP' : 'Sign In with Phone',
                style: AppTypography.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                _otpSent
                    ? 'Enter the verification code sent to ${_phoneController.text}'
                    : 'We will send a secure verification code to your mobile number.',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(height: 24),
              if (!_otpSent) ...[
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: AppTypography.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: AppTypography.bodySmall,
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                BoldButton(
                  text: 'Request OTP',
                  isLoading: _isLoading,
                  onPressed: _handleSendOtp,
                ),
              ] else ...[
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: AppTypography.tabularFigures.copyWith(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: '6-Digit OTP',
                    labelStyle: AppTypography.bodySmall,
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                BoldButton(
                  text: 'Verify & Sign In',
                  isLoading: _isLoading,
                  onPressed: _handleVerifyOtp,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

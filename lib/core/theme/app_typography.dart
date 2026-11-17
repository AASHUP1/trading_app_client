import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Typography and Layout guidelines from BOLD UI/UX Design Brief (Section 2)
/// Typeface: Inter with tabular numerals for financial prices and P&L
class AppTypography {
  AppTypography._();

  static TextStyle get displayLarge => GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    letterSpacing: -0.5,
  );

  static TextStyle get titleLarge => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    letterSpacing: -0.2,
  );

  static TextStyle get titleMedium => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
  );

  static TextStyle get bodySmall => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
  );

  static TextStyle get labelSmall => GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
    letterSpacing: 0.3,
  );

  /// Tabular figure style for real-time tickers and P&L numbers
  static TextStyle get tabularFigures => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFeatures: const [FontFeature.tabularFigures()],
  );
}

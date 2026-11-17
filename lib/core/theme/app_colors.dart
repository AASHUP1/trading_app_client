import 'package:flutter/material.dart';

/// Design tokens strictly adhered from BOLD UI/UX Design Brief (Section 2)
class AppColors {
  AppColors._();

  // Background & Surfaces
  static const Color appBackground = Color(0xFF0B0F14); // Main Background
  static const Color surface = Color(0xFF121923);       // Cards & Panels
  static const Color elevatedSurface = Color(0xFF1C2734); // Selected or Raised Cards
  static const Color border = Color(0xFF243242);
  static const Color divider = Color(0xFF1F2B39);

  // Financial Semantics
  static const Color primaryBullish = Color(0xFF38D996); // Positive Movement / Primary Action
  static const Color bearishLoss = Color(0xFFFF657A);    // Negative Movement / Loss
  static const Color warning = Color(0xFFF3C969);        // Caution & Risk Notices
  static const Color accentBlue = Color(0xFF3B82F6);      // Informational / Technical

  // Typography & Text
  static const Color primaryText = Color(0xFFEAF0F6);    // Main Text
  static const Color secondaryText = Color(0xFF92A0B2);  // Labels & Helper Text
  static const Color disabledText = Color(0xFF5A697A);   // Inactive / Disabled
}

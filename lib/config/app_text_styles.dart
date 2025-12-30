import 'package:business_transactions/config/app_colors.dart';
import 'package:business_transactions/config/constants/string_const.dart';
import 'package:business_transactions/config/glass_theme.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  // --- BASE ---
  static const TextStyle _base = TextStyle(
    fontFamily: proximaNovaFont,
  );

  // --- 1. MAIN HEADERS (Welcome Section) ---
  static TextStyle get sectionHeader => _base.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textDarkMain,
      );

  static TextStyle get headerSubtitle => _base.copyWith(
      fontSize: 12, color: GlassColors.textSubtle
      // Color is usually dynamic (Grey 400 vs 600), handled in widget or via helper
      );

  // --- 2. GLASS CARDS (Header Stats) ---
  static TextStyle get cardLabelSmall => _base.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        // Color depends on context (Success/Warning)
      );

  static TextStyle get amountHeader => _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      );

  // --- 3. ACTIVE JOB LIST CARDS ---
  static TextStyle get cardTitle => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.textDarkMain,
      );

  static TextStyle get cardSubtitle => _base.copyWith(
        fontSize: 12,
        color: GlassColors.textSubtle,
      );

  static TextStyle get amountList => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.textDarkMain,
      );

  static TextStyle get statusLabel => _base.copyWith(
        fontSize: 10, // Used for pills
        fontWeight: FontWeight.bold,
      );

  static TextStyle get statusLabelList => _base.copyWith(
        fontSize: 11, // Used for "Paid: 500" row
        fontWeight: FontWeight.bold,
      );

  // --- 4. PRIORITY ALERT ---
  static TextStyle get alertTitle => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.error, // Always Red
      );

  static TextStyle get alertSubtitle => _base.copyWith(
        fontSize: 12,
        color: GlassColors.textSubtle,
        // Color dynamic
      );

  static TextStyle get linkText => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        // Color dynamic
      );

  static TextStyle get linkTextSmall => _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get placeholder => _base.copyWith(
        fontSize: 14,
        color: GlassColors.textSubtle,
      );

  // --- 5. CHIPS ---
  static TextStyle get chipLabel => _base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.bold,
      );

  // --- HELPERS ---
  static Color getThemeColor(BuildContext context,
      {required Color light, Color? dark}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? (dark ?? Colors.white) : light;
  }
}

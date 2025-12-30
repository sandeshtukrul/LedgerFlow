import 'package:flutter/material.dart';

class AppColors {
  // Private constructor
  const AppColors._();

  // --- STATUS COLORS (Logic) ---
  static const Color success = Color(0xFF10B981); // Emerald Green (Paid)
  static const Color error = Color(0xFFEF4444); // Red (Unpaid/Overdue)
  static const Color warning = Color(0xFFF59E0B); // Amber (Partial)

  // --- SURFACE COLORS (Opaque) ---
  // Used for list cards where we don't want transparency
  static const Color cardSurfaceDark = Color(0xFF1C1C1E);
  static const Color cardSurfaceLight = Colors.white;

  // --- NEUTRALS(Slate 800) ---
  static const Color neutralDark = Color(0xFF1E293B);
  static const Color textDarkMain = Color(0xFF0F172A);

  // --- OPACITIES ---
  static const double statusPillOpacity = 0.1;
  static const double glassOpacityLow = 0.1;
}

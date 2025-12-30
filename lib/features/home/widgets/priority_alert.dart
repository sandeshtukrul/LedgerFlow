import 'package:business_transactions/config/app_colors.dart';
import 'package:business_transactions/config/app_text_styles.dart';
import 'package:business_transactions/config/constants/string_const.dart';
import 'package:business_transactions/config/glass_theme.dart';
import 'package:flutter/material.dart';

class PriorityAlert extends StatelessWidget {
  final int overdueCount;
  final VoidCallback onTap;

  const PriorityAlert(
      {super.key, required this.overdueCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        // Use standard glass background instead of all-red
        color: isDark ? GlassColors.glassPanelDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        // Subtle red border to indicate urgency
        border: Border.all(
          color: AppColors.error.withValues(alpha: isDark ? 0.3 : 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Red warning icon
                const Icon(Icons.warning_amber_rounded,
                    color: Color(0xFFEF4444), size: 22),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Red title for urgency
                      Text(
                        txtActionRequired,
                        style: AppTextStyles.alertTitle,
                      ),
                      const SizedBox(height: 2),
                      // Neutral subtitle
                      Text(
                        "$overdueCount $txtOverdueSuffix",
                        style: AppTextStyles.alertSubtitle.copyWith(
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                // Simple "View" text with arrow
                Row(
                  children: [
                    Text(
                      txtView,
                      style: AppTextStyles.linkText.copyWith(
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: isDark ? Colors.white54 : Colors.black38,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

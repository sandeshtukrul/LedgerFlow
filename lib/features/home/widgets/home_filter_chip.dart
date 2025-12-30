import 'package:business_transactions/config/app_text_styles.dart';
import 'package:business_transactions/config/glass_theme.dart';
import 'package:flutter/material.dart';

class HomeFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const HomeFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            // Background: Primary if selected, Glass if not
            color: isSelected
                ? theme.primary
                : (isDark ? GlassColors.glassPanelDark : Colors.white),
            borderRadius: BorderRadius.circular(30),
            // Border: None if selected, Subtle if not
            border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : (isDark
                      ? Colors.white24
                      : Colors.grey.withValues(alpha: 0.2)),
            ),
          ),
          child: Text(
            label,
            style: AppTextStyles.chipLabel.copyWith(
              color: isSelected
                  ? (isDark ? Colors.black : Colors.white)
                  : (isDark ? Colors.white54 : Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}

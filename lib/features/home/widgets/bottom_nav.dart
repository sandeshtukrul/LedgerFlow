import 'package:business_transactions/config/constants/string_const.dart';
import 'package:business_transactions/config/glass_theme.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        // Glass Background Logic
        color: isDark ? GlassColors.bottomNavDark : GlassColors.bottomNavLight,
        border: Border(
          top: BorderSide(
            color:
                isDark ? GlassColors.navBorderDark : GlassColors.navBorderLight,
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor:
            Colors.transparent, // Transparent to show glass container
        elevation: 0,
        type: BottomNavigationBarType.fixed,

        // Colors
        selectedItemColor: primaryColor,
        unselectedItemColor: isDark ? Colors.white38 : Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: navHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded),
            label: navLedger,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: navReports,
          ),
        ],
      ),
    );
  }
}

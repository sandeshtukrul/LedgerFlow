// lib/features/home/widgets/glass_header.dart
import 'package:business_transactions/config/app_colors.dart';
import 'package:business_transactions/config/app_text_styles.dart';
import 'package:business_transactions/config/constants/string_const.dart';
import 'package:business_transactions/config/glass_theme.dart';
import 'package:business_transactions/core/utils/formatters.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String username;
  final double cashInHand;
  final double pendingDues;
  final VoidCallback onCashTap;
  final VoidCallback onDuesTap;

// Mock Data for Page 2 (Performance)
  final double totalCollectedMonth;
  final double totalJobValueMonth;

  const Header({
    super.key,
    required this.username,
    required this.cashInHand,
    required this.pendingDues,
    required this.onCashTap,
    required this.onDuesTap,
    this.totalCollectedMonth = 154000, // Mock
    this.totalJobValueMonth = 210000, // Mock
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark
                            ? Colors.white24
                            : Colors.grey.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          isDark ? Colors.white10 : Colors.grey[100],
                      child: Text(
                        widget.username[0],
                        style: TextStyle(
                          color: theme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(txtWelcomeBack,
                          style: AppTextStyles.headerSubtitle.copyWith(
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                          )),
                      Text(widget.username,
                          style: AppTextStyles.sectionHeader.copyWith(
                            color: isDark ? Colors.white : GlassColors.textDark,
                          )),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.05),
                  border: Border.all(
                      color: isDark ? Colors.white12 : Colors.black12),
                ),
                child: Icon(Icons.search,
                    color: isDark ? Colors.white : GlassColors.textDark),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 110,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            children: [
              // PAGE 1: Single Card split into two sections
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 2.0), // Spacing between pages
                child: _buildCombinedStatusCard(context),
              ),

              // PAGE 2: Performance Card
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 2.0), // Spacing between pages
                child: _buildPerformanceCard(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // --- PAGE INDICATOR DOTS ---
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: _currentPage == index ? 20 : 6,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? (isDark ? Colors.white : AppColors.neutralDark)
                    : (isDark
                        ? Colors.white24
                        : Colors.grey.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget _buildCombinedStatusCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color:
            isDark ? GlassColors.glassPanelDark : GlassColors.glassPanelLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? GlassColors.glassBorderDark
              : GlassColors.glassBorderLight,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 16,
              offset: const Offset(0, 4))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Row(
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onCashTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.account_balance_wallet_rounded,
                                  color: AppColors.success, size: 16),
                              SizedBox(width: 6),
                              Text(
                                txtCashInHand,
                                style: AppTextStyles.cardLabelSmall.copyWith(
                                  color: AppColors.success,
                                ),
                              )
                            ]),
                        const SizedBox(height: 8),
                        Text(
                          Formatters.formatCurrency(widget.cashInHand.toInt()),
                          style: AppTextStyles.amountHeader.copyWith(
                            color: isDark
                                ? GlassColors.textLight
                                : GlassColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
                width: 1,
                height: 60,
                color: isDark
                    ? Colors.white12
                    : Colors.grey.withValues(alpha: 0.1)),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onDuesTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pending_actions_rounded,
                                  color: AppColors.warning, size: 16),
                              SizedBox(width: 6),
                              // FIX: Terminology Change
                              Text(
                                txtToCollect,
                                style: AppTextStyles.cardLabelSmall.copyWith(
                                  color: AppColors.warning,
                                ),
                              )
                            ]),
                        const SizedBox(height: 8),
                        Text(
                          Formatters.formatCurrency(widget.pendingDues.toInt()),
                          style: AppTextStyles.amountHeader.copyWith(
                            color: isDark
                                ? GlassColors.textLight
                                : GlassColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// This is demo card we have to extract colors and text from it when we actually use.

// --- PAGE 2: PERFORMANCE CARD ---
  Widget _buildPerformanceCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        // Slightly different tint to distinguish pages
        color: isDark
            ? const Color(0xFF1E293B).withValues(alpha: 0.5)
            : Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isDark ? Colors.white10 : Colors.white60),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("This Month's Performance",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.bar_chart, color: theme.primary),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPerfStat(
                  context, "Total Business", widget.totalJobValueMonth),
              Container(
                  width: 1, height: 30, color: Colors.grey.withOpacity(0.2)),
              _buildPerfStat(context, "Collected", widget.totalCollectedMonth),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPerfStat(BuildContext context, String label, double amount) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 11,
                color: isDark ? Colors.grey[400] : Colors.grey[600])),
        const SizedBox(height: 4),
        Text(Formatters.formatCurrency(amount.toInt()),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87)),
      ],
    );
  }
}

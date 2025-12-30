import 'package:business_transactions/config/app_colors.dart';
import 'package:business_transactions/config/app_text_styles.dart';
import 'package:business_transactions/config/constants/string_const.dart';
import 'package:business_transactions/config/glass_theme.dart';
import 'package:business_transactions/core/utils/formatters.dart';
import 'package:business_transactions/features/home/models/mock_dashboard_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JobCard extends StatelessWidget {
  final MockJob job;
  final VoidCallback onTap;

  const JobCard({super.key, required this.job, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasVehicle = job.vehicleName.isNotEmpty;
    final mainTitle = hasVehicle ? job.vehicleName : txtGeneralService;
    final subTitle = job.customerName;
    final dateString = DateFormat(dateFormatMMMd).format(job.date);

    // LOGIC: Status Text & Color
    final isUnpaid = job.paidAmount == 0;
    String statusText;
    Color statusColor;

    if (job.isFullyPaid) {
      statusText = statusPaid;
      statusColor = AppColors.success; // Emerald
    } else if (isUnpaid) {
      statusText = statusUnpaid;
      statusColor = AppColors.error; // Red
    } else {
      statusText = statusPartial;
      statusColor = AppColors.warning; // Amber
    }

    final cardColor =
        isDark ? GlassColors.glassPanelDark : GlassColors.glassBorderLight;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.grey.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // TOP ROW: Title & Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mainTitle,
                            style: AppTextStyles.cardTitle.copyWith(
                                color: AppTextStyles.getThemeColor(context,
                                    light: AppColors.textDarkMain)),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                subTitle,
                                style: AppTextStyles.cardSubtitle.copyWith(
                                  color: isDark
                                      ? Colors.grey[400]
                                      : GlassColors.textSubtle,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Icon(Icons.circle,
                                    size: 4,
                                    color: isDark
                                        ? Colors.grey[600]
                                        : Colors.grey[300]),
                              ),
                              Text(dateString,
                                  style: AppTextStyles.cardSubtitle.copyWith(
                                      color: isDark
                                          ? Colors.grey[400]
                                          : GlassColors.textSubtle,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Amount & Status
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          Formatters.formatCurrency(job.totalBill.toInt()),
                          style: AppTextStyles.amountList.copyWith(
                              color: AppTextStyles.getThemeColor(context,
                                  light: GlassColors.textDark)),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(
                                alpha: AppColors.statusPillOpacity),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            statusText,
                            style: AppTextStyles.statusLabel.copyWith(
                              color: statusColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                // DESIGN DECISION: Hide progress bar if Fully Paid.
                // Keep it if Unpaid/Partial to show "how much is left".
                if (!job.isFullyPaid && !isUnpaid) ...[
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: job.progress,
                      backgroundColor: isDark
                          ? Colors.white.withValues(alpha: 0.15)
                          : Colors.grey[300],
                      color: AppColors.success,
                      minHeight: 6,
                    ),
                  ),
                ],

                // BOTTOM LABELS (Hide if fully paid, user already knows it's settled)
                if (!job.isFullyPaid && !isUnpaid) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "$lblPaid${Formatters.formatCurrency(job.paidAmount.toInt())}",
                          style: AppTextStyles.statusLabel.copyWith(
                              color: AppColors.success, fontSize: 11)),
                      Text(
                          "$lblDue${Formatters.formatCurrency(job.dueAmount.toInt())}",
                          style: AppTextStyles.statusLabel
                              .copyWith(color: AppColors.error, fontSize: 11)),
                    ],
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

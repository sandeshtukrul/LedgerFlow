import 'package:business_transactions/config/app_colors.dart';
import 'package:business_transactions/config/app_text_styles.dart';
import 'package:business_transactions/config/constants/string_const.dart';
import 'package:business_transactions/features/home/models/mock_dashboard_data.dart';
import 'package:business_transactions/features/home/widgets/job_card.dart';
import 'package:business_transactions/features/home/widgets/header.dart';
import 'package:business_transactions/features/home/widgets/home_filter_chip.dart';
import 'package:business_transactions/features/home/widgets/priority_alert.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  final String username;

  const DashboardView({super.key, required this.username});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  // 1. STATE MOVED HERE
  int _selectedFilterIndex = 0;
  final List<String> _filters = [filterAll, filterToCollect, filterSettled];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 2. LOGIC MOVED HERE
    final displayJobs = _getFilteredJobs();

    // Calculate Totals
    double cashInHand = kMockJobs.fold(0, (sum, item) => sum + item.paidAmount);
    double pendingDues = kMockJobs.fold(0, (sum, item) => sum + item.dueAmount);
    final overdueCount = kMockJobs.where((j) => j.isOverdue).length;

    // 3. UI MOVED HERE
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Header(
            username: widget.username,
            cashInHand: cashInHand,
            pendingDues: pendingDues,
            onCashTap: () {},
            onDuesTap: () => setState(() => _selectedFilterIndex = 1),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return HomeFilterChip(
                  label: _filters[index],
                  isSelected: _selectedFilterIndex == index,
                  onTap: () => setState(() => _selectedFilterIndex = index),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          if (overdueCount > 0 && _selectedFilterIndex != 2)
            PriorityAlert(
                overdueCount: overdueCount,
                onTap: () => setState(() => _selectedFilterIndex = 1)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(txtActiveJobs,
                  style: AppTextStyles.sectionHeader.copyWith(
                      color: isDark ? Colors.white : AppColors.textDarkMain)),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to full history screen
                },
                child: Text(
                  txtViewHistory,
                  style: AppTextStyles.linkText.copyWith(
                      color: isDark ? Colors.white70 : Colors.black54),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          if (displayJobs.isEmpty)
            Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(
                    child: Text(txtNoJobs,
                        style: AppTextStyles.placeholder.copyWith(
                            color: isDark ? Colors.white54 : Colors.black45))))
          else
            ...displayJobs.map((job) => JobCard(
                  job: job,
                  onTap: () {},
                )),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  // 4. HELPER METHODS MOVED HERE
  List<MockJob> _getFilteredJobs() {
    List<MockJob> jobs = List.from(kMockJobs);

    if (_selectedFilterIndex == 1) {
      jobs = jobs.where((j) => !j.isFullyPaid).toList();
    } else if (_selectedFilterIndex == 2) {
      jobs = jobs.where((j) => j.isFullyPaid).toList();
    }

    jobs.sort((a, b) {
      if (a.isOverdue && !b.isOverdue) return -1;
      return b.date.compareTo(a.date);
    });

    return jobs;
  }
}

import 'package:business_transactions/data/local/job_local_data_source.dart';
import 'package:business_transactions/models/customer.dart';
import 'package:business_transactions/models/job.dart';
import 'package:business_transactions/models/transaction.dart';
import 'package:business_transactions/models/vehicle.dart';

class JobRepository {
  final JobLocalDataSource localDataSource;

  JobRepository(this.localDataSource);

  // --- READS ---

  /// Get all active jobs (Sorted by Newest First)
  Future<List<Job>> getActiveJobs() async {
    final allJobs = await localDataSource.getAllJobs();
    
    final activeJobs = allJobs
        .where((job) => job.status == JobStatus.open)
        .toList();
    
    activeJobs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return activeJobs;
  }

  /// Get history for a specific customer
  Future<List<Job>> getJobsForCustomer(String customerId) async {
    final allJobs = await localDataSource.getAllJobs();
    
    final customerJobs = allJobs
        .where((job) => job.customerId == customerId)
        .toList();
    
    // Sort: Open first, then by date
    customerJobs.sort((a, b) {
      if (a.status != b.status) {
        return a.status == JobStatus.open ? -1 : 1;
      }
      return b.createdAt.compareTo(a.createdAt);
    });
    return customerJobs;
  }

  // --- WRITES ---

  Future<void> createJob({
    required Customer customer,
    required int totalBill,
    Vehicle? vehicle,
  }) {
    final newJob = Job(
      customerId: customer.id,
      vehicleId: vehicle?.id,
      customerNameSnapshot: customer.name,
      vehicleNameSnapshot: vehicle?.displayName,
      totalBill: totalBill,
      status: JobStatus.open,
    );
    return localDataSource.addOrUpdateJob(newJob);
  }

  Future<void> addTransaction(String jobId, Transaction transaction) {
    return localDataSource.addTransactionToJob(jobId, transaction);
  }

  Future<void> updateJobDetails(String jobId, {int? newTotalBill}) async {
    final job = await localDataSource.getJobById(jobId);
    if (job != null) {
      final updatedJob = job.copyWith(
        totalBill: newTotalBill ?? job.totalBill,
      );
      return localDataSource.addOrUpdateJob(updatedJob);
    }
  }

  Future<void> closeJob(String jobId) async {
    final job = await localDataSource.getJobById(jobId);
    if (job != null) {
      final closedJob = job.copyWith(
        status: JobStatus.closed,
        closedAt: DateTime.now(),
      );
      return localDataSource.addOrUpdateJob(closedJob);
    }
  }

  /// Get ALL closed jobs (Global History)
  /// Sorted by 'closedAt' date (Most recently finished first)
  Future<List<Job>> getClosedJobs() async {
    final allJobs = await localDataSource.getAllJobs();
    
    final closedJobs = allJobs
        .where((job) => job.status == JobStatus.closed)
        .toList();
    
    // Sort: Newest closed jobs on top
    closedJobs.sort((a, b) {
      final dateA = a.closedAt ?? a.createdAt;
      final dateB = b.closedAt ?? b.createdAt;
      return dateB.compareTo(dateA);
    });
    
    return closedJobs;
  }
}
import 'package:business_transactions/models/job.dart';
import 'package:business_transactions/models/transaction.dart';
import 'package:hive_ce/hive_ce.dart';

class JobLocalDataSource {
  final Box<Job> _jobsBox;

  JobLocalDataSource(this._jobsBox);

  /// Get ALL jobs
  Future<List<Job>> getAllJobs() async {
    return _jobsBox.values.toList();
  }

  /// Add or Update a Job
  Future<void> addOrUpdateJob(Job job) async {
    if (_jobsBox.containsKey(job.key)) {
      await _jobsBox.put(job.key, job);
    } else {
      await _jobsBox.add(job);
    }
  }

  /// Get a specific job by ID
  Future<Job?> getJobById(String jobId) async {
    try {
      return _jobsBox.values.firstWhere((j) => j.id == jobId);
    } catch (e) {
      return null;
    }
  }

  /// Add a transaction to a specific job
  /// We do this here to ensure the Hive 'save' happens on the correct object instance.
  Future<void> addTransactionToJob(String jobId, Transaction transaction) async {
    final job = _jobsBox.values.firstWhere((j) => j.id == jobId);
    job.transactions.add(transaction);
    await job.save();
  }
}
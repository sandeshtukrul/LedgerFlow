import 'package:business_transactions/models/transaction.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:uuid/uuid.dart';

part 'job.g.dart';

@HiveType(typeId: 6)
enum JobStatus {
  @HiveField(0)
  open,
  @HiveField(1)
  closed,
}

@HiveType(typeId: 5)
class Job extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String customerId; // Foreign Key to Customer

  @HiveField(2)
  final String? vehicleId; // Foreign Key to Vehicle inside Customer

  @HiveField(3)
  final JobStatus status;

  @HiveField(4)
  final DateTime createdAt;

  @HiveField(5)
  final DateTime? closedAt;

  @HiveField(6)
  final List<Transaction> transactions;

  // --- SNAPSHOTS (Safety against deletion) ---
  // If you delete the Customer/Vehicle later, these strings keep history readable.
  @HiveField(7)
  final String customerNameSnapshot; 

  @HiveField(8)
  final String? vehicleNameSnapshot;

  @HiveField(9)
  final int totalBill;

  Job({
    String? id,
    required this.customerId,
    this.vehicleId,
    required this.customerNameSnapshot,
    this.vehicleNameSnapshot,
    this.status = JobStatus.open,
    DateTime? createdAt,
    this.closedAt,
    this.totalBill = 0,
    List<Transaction>? transactions,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        transactions = transactions ?? [];

  
  Job copyWith({
    String? id,
    String? customerId,
    String? vehicleId,
    String? customerNameSnapshot,
    String? vehicleNameSnapshot,
    JobStatus? status,
    DateTime? createdAt,
    DateTime? closedAt,
    int? totalBill,
    List<Transaction>? transactions,
  }) {
    return Job(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      vehicleId: vehicleId ?? this.vehicleId,
      customerNameSnapshot: customerNameSnapshot ?? this.customerNameSnapshot,
      vehicleNameSnapshot: vehicleNameSnapshot ?? this.vehicleNameSnapshot,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      closedAt: closedAt ?? this.closedAt,
      totalBill: totalBill ?? this.totalBill,
      transactions: transactions ?? this.transactions,
    );
  }

// --- REVISED GETTERS ---

  /// 1. Money In (From Customer)
  int get totalCollected {
    return transactions
        .where((t) => t.type == TransactionType.received)
        .fold(0, (sum, t) => sum + t.amount);
  }

  /// 2. Money Out (Vendor Expenses + Dad Transfers)
  int get totalExpenses {
    return transactions
        .where((t) => t.type == TransactionType.sent)
        .fold(0, (sum, t) => sum + t.amount);
  }

  /// 3. Pending Due (Logic: Bill - Collected)
  /// This separates "Your Costs" from "Customer's Bill"
  int get dueAmount => totalBill - totalCollected;

  /// 4. Is the Job Settled? (Customer paid fully)
  bool get isFullyPaid => totalBill > 0 && dueAmount <= 0;

  /// 5. Current Cash Balance in this Job
  /// (Should be 0 after you transfer profit to Dad)
  int get cashBalance => totalCollected - totalExpenses;
}
// mock data model
class MockJob {
  final String id;
  final String customerName;
  final String vehicleName; // e.g., "Swift Dzire"
  final String status; // "In Garage", "Ready", "Delivered"
  final double totalBill;
  final double paidAmount;
  final DateTime date;

  MockJob({
    required this.id,
    required this.customerName,
    required this.vehicleName,
    required this.status,
    required this.totalBill,
    required this.paidAmount,
    required this.date,
  });

  // Business Logic Getters
  double get dueAmount => totalBill - paidAmount;
  double get progress => totalBill == 0 ? 0 : paidAmount / totalBill;
  bool get isFullyPaid => dueAmount <= 0;
  bool get isOverdue => date.difference(DateTime.now()).inDays.abs() > 30;
}

// --- MOCK DATA FOR UI TESTING ---
final List<MockJob> kMockJobs = [
  MockJob(
    id: '1',
    customerName: "Sachin Tejam",
    vehicleName: "Honda City (MH-12)",
    status: "Delivered",
    totalBill: 5000,
    paidAmount: 1000, // Partial Payment
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  MockJob(
    id: '2',
    customerName: "Rahul Traders",
    vehicleName: "Tata Ace",
    status: "In Garage",
    totalBill: 12000,
    paidAmount: 0, // No Payment yet
    date: DateTime.now(),
  ),
  MockJob(
    id: '3',
    customerName: "Amit General",
    vehicleName: "Maruti Swift",
    status: "Ready",
    totalBill: 2500,
    paidAmount: 2500, // Fully Paid
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  MockJob(
    id: '4',
    customerName: "Rahul Traders",
    vehicleName: "Tata Ace (MH-04)",
    status: "Delivered",
    totalBill: 12500,
    paidAmount: 0,
    date: DateTime.now().subtract(const Duration(days: 45)), // 45 Days old
  ),

  // 2. ACTIVE: Partial Payment
  MockJob(
    id: '5',
    customerName: "Sachin Tejam",
    vehicleName: "Honda City",
    status: "Delivered",
    totalBill: 5000,
    paidAmount: 1000,
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),

  // 3. ACTIVE: In Garage (New Job)
  MockJob(
    id: '6',
    customerName: "Amit General",
    vehicleName: "Maruti Swift",
    status: "In Garage",
    totalBill: 3000,
    paidAmount: 0,
    date: DateTime.now(), // Today
  ),

  // 4. SETTLED: History (Should not appear in Active list)
  MockJob(
    id: '7',
    customerName: "Pooja Electronics",
    vehicleName: "Hero Splendor",
    status: "Delivered",
    totalBill: 450,
    paidAmount: 450, // Fully Paid
    date: DateTime.now().subtract(const Duration(days: 5)),
  ),

  // 5. SETTLED: History (Old)
  MockJob(
    id: '8',
    customerName: "Amit Rane",
    vehicleName: "",
    status: "Delivered",
    totalBill: 1200,
    paidAmount: 1200,
    date: DateTime.now().subtract(const Duration(days: 10)),
  ),
];

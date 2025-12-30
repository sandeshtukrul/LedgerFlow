import 'package:business_transactions/config/constants/string_const.dart';
import 'package:business_transactions/hive_registrar.g.dart';
import 'package:business_transactions/models/customer.dart';
import 'package:business_transactions/models/job.dart';
import 'package:business_transactions/models/vendor.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// Initializes essential application services before the UI starts.
/// This acts as the "Pre-flight check" ensuring Database and Configs are ready.
Future<void> bootstrap() async {
  // 1. Initialize the local database (Hive)
  await Hive.initFlutter();

  // 2. REGISTER ADAPTERS(all adapter in one file)
  Hive.registerAdapters();

  // 3. Open the Box here (globally accessible via Hive.box later)
  // This ensures the box is open before any Provider tries to read it.
  await Hive.openBox<Customer>(customersBox);
  await Hive.openBox<Job>(jobsBox);
  await Hive.openBox<Vendor>(vendorsBox);
}

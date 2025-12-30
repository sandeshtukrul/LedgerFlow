import 'package:hive_ce/hive_ce.dart';
import 'package:uuid/uuid.dart';

part 'vendor.g.dart';

@HiveType(typeId: 4)
class Vendor extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? phone;

  Vendor({
    String? id,
    required this.name,
    this.phone,
  }) : id = id ?? const Uuid().v4();

  Vendor copyWith({
    String? id,
    String? name,
    String? phone,
  }) {
    return Vendor(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }
}
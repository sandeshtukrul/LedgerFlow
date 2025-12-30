import 'package:hive_ce/hive.dart';
import 'package:uuid/uuid.dart';

part 'vehicle.g.dart';

@HiveType(typeId: 3)
class Vehicle extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? number;

  @HiveField(3)
  final DateTime createdAt;

  Vehicle({
    String? id,
    required this.name,
    this.number,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
  createdAt = createdAt ?? DateTime.now();

  Vehicle copyWith({
    String? id,
    String? name,
    String? number,
    DateTime? createdAt,
  }) {
    return Vehicle(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  String get displayName => number != null ? "$name - $number" : name;
}
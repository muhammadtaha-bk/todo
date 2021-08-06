import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  late int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  String status;

  @HiveField(4)
  String? startDate;

  @HiveField(5)
  String? startTime;

  @HiveField(6)
  String? endDate;

  @HiveField(7)
  String? endTime;

  Task({
    required this.title,
    this.description,
    required this.status,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
  }) {
    id = DateTime.now().microsecondsSinceEpoch ~/ 1000;
  }
}

import 'package:intl/intl.dart';

class Task {
  late int id;
  final String title;
  final String? description;
  String status;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;

  Task({
    required this.title,
    this.description,
    required this.status,
    this.startDate,
    this.startTime,
  }) {
    id = DateTime.now().microsecondsSinceEpoch ~/ 1000;
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    startDate = dateFormat.format(DateTime.now());
  }
}

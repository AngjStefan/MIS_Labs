import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  ExamDetailScreen({required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;

    final formattedDateTime =
        "${exam.dateTime.day.toString().padLeft(2, '0')}."
        "${exam.dateTime.month.toString().padLeft(2, '0')}."
        "${exam.dateTime.year} во "
        "${exam.dateTime.hour.toString().padLeft(2, '0')}:"
        "${exam.dateTime.minute.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(title: Text(exam.subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Предмет: ${exam.subjectName}"),
            Text("Датум: $formattedDateTime"),
            Text("Простории: ${exam.rooms.join(", ")}"),
            SizedBox(height: 20),
            Text("Преостанато време: $days дена, $hours часа"),
          ],
        ),
      ),
    );
  }
}
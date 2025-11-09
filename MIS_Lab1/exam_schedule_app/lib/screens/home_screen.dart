import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subjectName: "Математика", dateTime: DateTime(2025, 1, 10, 9, 0), rooms: ["A1", "A2"]),
    Exam(subjectName: "Физика", dateTime: DateTime(2025, 1, 12, 14, 0), rooms: ["B1"]),
    Exam(subjectName: "Програмирање", dateTime: DateTime(2025, 1, 15, 11, 0), rooms: ["Lab1"]),
    Exam(subjectName: "Алгоритми", dateTime: DateTime(2025, 1, 18, 13, 0), rooms: ["C2"]),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime(2025, 1, 20, 9, 30), rooms: ["D1"]),
    Exam(subjectName: "Оперативни системи", dateTime: DateTime(2025, 1, 22, 15, 0), rooms: ["E3"]),
    Exam(subjectName: "Компјутерски мрежи", dateTime: DateTime(2025, 1, 25, 10, 0), rooms: ["F1"]),
    Exam(subjectName: "Вештачка интелигенција", dateTime: DateTime(2025, 1, 28, 12, 0), rooms: ["G2"]),
    Exam(subjectName: "Мобилни апликации", dateTime: DateTime(2025, 11, 30, 16, 0), rooms: ["H1"]),
    Exam(subjectName: "Софтверско инженерство", dateTime: DateTime(2025, 12, 2, 9, 0), rooms: ["I1"]),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(title: Text("Распоред за испити - 221198")),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          final isPast = exam.dateTime.isBefore(DateTime.now());
          return Card(
            color: isPast ? Colors.green[100] : Colors.blue[100],
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(
                exam.subjectName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "${exam.dateTime.day.toString().padLeft(2, '0')}."
                        "${exam.dateTime.month.toString().padLeft(2, '0')}."
                        "${exam.dateTime.year} во "
                        "${exam.dateTime.hour.toString().padLeft(2, '0')}:"
                        "${exam.dateTime.minute.toString().padLeft(2, '0')}",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.room, size: 16),
                      const SizedBox(width: 4),
                      Text(exam.rooms.join(", ")),
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExamDetailScreen(exam: exam),
                  ),
                );
              },
              ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Вкупно испити: ${exams.length}"),
        ),
      ),
    );
  }
}
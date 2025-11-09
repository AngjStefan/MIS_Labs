import 'package:flutter/material.dart';

class ExamBadge extends StatelessWidget {
  final int totalExams;

  const ExamBadge({required this.totalExams, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.deepPurple,
      child: Center(
        child: Text(
          "Вкупно испити: $totalExams",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
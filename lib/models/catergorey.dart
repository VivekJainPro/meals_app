import 'package:flutter/material.dart';

class Categorey {
  const Categorey(
      {required this.title, required this.id, this.color = Colors.orange}
      );

  final String id;
  final String title;
  final Color color;
}

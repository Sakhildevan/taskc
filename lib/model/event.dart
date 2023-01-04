import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroungColor;
  final bool isAllDay;
  const Event({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.backgroungColor = const Color.fromARGB(255, 96, 253, 6),
    this.isAllDay = false,
  });
}

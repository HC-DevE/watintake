import 'package:flutter/material.dart';

class Workout {
  final String id;
  final String name;
  final IconData icon;
  final int duration;
  final double intensity;

  const Workout({
    required this.id,
    required this.name,
    required this.icon,
    required this.duration,
    required this.intensity,
  });
}

import 'package:flutter/material.dart';

class MainState {
  final String name;
  final int count;
  final Color color;

  MainState({
    required this.name,
    required this.count,
    required this.color,
  });

  MainState copyWith({
    String? name,
    int? count,
    Color? color,
  }) {
    return MainState(
      name: name ?? this.name,
      count: count ?? this.count,
      color: color ?? this.color,
    );
  }
}

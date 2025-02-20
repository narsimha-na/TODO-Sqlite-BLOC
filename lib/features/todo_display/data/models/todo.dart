import 'dart:convert';

import 'package:todo_bloc_sqllite/core/constants/db_helper.dart';

class Todo {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Todo({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Todo copyWith({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) {
    return Todo(
      id: id ?? this.id,
      isImportant: isImportant ?? this.isImportant,
      number: number ?? this.number,
      title: title ?? this.title,
      description: description ?? this.description,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      DbHelper.id: id,
      DbHelper.isImportant: isImportant ? 1 : 0,
      DbHelper.number: number,
      DbHelper.title: title,
      DbHelper.description: description,
      DbHelper.time: createdTime.millisecondsSinceEpoch,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map[DbHelper.id] != null ? map[DbHelper.id] as int : null,
      isImportant: map[DbHelper.isImportant] == 1,
      number: map[DbHelper.number] as int,
      title: map[DbHelper.title] as String,
      description: map[DbHelper.description] as String,
      createdTime:
          DateTime.fromMillisecondsSinceEpoch(map[DbHelper.time] as int),
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, isImportant: $isImportant, number: $number, title: $title, description: $description, createdTime: $createdTime)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.isImportant == isImportant &&
        other.number == number &&
        other.title == title &&
        other.description == description &&
        other.createdTime == createdTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isImportant.hashCode ^
        number.hashCode ^
        title.hashCode ^
        description.hashCode ^
        createdTime.hashCode;
  }
}

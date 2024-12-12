import 'package:flutter/material.dart';
import '../../common/util.dart';

enum TaskStatus {
  pending,
  inProgress,
  completed,
  overdue,
}

class Task extends ChangeNotifier {
  final String id;
  String title;
  String description;
  TaskStatus status;
  DateTime? dueDate;
  int priority;
  DateTime createdAt;
  DateTime? updatedAt;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.status = TaskStatus.pending,
    this.dueDate,
    this.priority = 3,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Method to update the status
  void updateStatus(TaskStatus newStatus) {
    status = newStatus;
    updatedAt = DateTime.now();
    notifyListeners();
  }

  // Method to check and update the status to overdue
  void checkForOverdue() {
    if (status != TaskStatus.completed &&
        dueDate != null &&
        DateTime.now().isAfter(dueDate!)) {
      status = TaskStatus.overdue;
      updatedAt = DateTime.now();
      notifyListeners();
    }
  }

  // Method to update other fields of the task
  void update({
    String? title,
    String? description,
    TaskStatus? status,
    DateTime? dueDate,
    int? priority,
  }) {
    if (title != null) this.title = title;
    if (description != null) this.description = description;
    if (status != null) this.status = status;
    if (dueDate != null) this.dueDate = dueDate;
    if (priority != null) this.priority = priority;
    updatedAt = DateTime.now();
    notifyListeners();
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, status: $status, dueDate: $dueDate, priority: $priority)';
  }

  // Convert Task to Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status.index, // Save as int
      'dueDate': dueDate?.millisecondsSinceEpoch, // Convert to int
      'priority': priority,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  // Create Task from Map<String, dynamic>
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'] ?? '',
      status: TaskStatus.values[map['status']],
      // Convert int to enum
      dueDate: map['dueDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dueDate'])
          : null,
      priority: map['priority'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'])
          : null,
    );
  }
}




import 'package:flutter/material.dart';
import '../../common/util.dart';

enum TaskStatus {
  pending, // Task is not started
  inProgress, // Task is currently being worked on
  completed, // Task is completed
  overdue, // Task's due date has passed without completion
}

class Task extends ChangeNotifier {
  final String id = generateId(); // Unique identifier for the task
  String title; // Title of the task
  String description; // Detailed description of the task (optional)
  TaskStatus status; // Current status of the task
  DateTime? dueDate; // Optional due date for the task
  int priority; // Priority level: e.g., 1 (High), 2 (Medium), 3 (Low)
  DateTime createdAt; // Timestamp when the task was created
  DateTime? updatedAt; // Timestamp when the task was last updated

  Task({
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




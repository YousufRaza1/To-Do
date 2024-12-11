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

class TaskDataManager extends ChangeNotifier {
  List<Task> allTask = [
    Task(
      title: 'Submit Assignment',
      description: 'Upload to the university portal',
      status: TaskStatus.pending,
      dueDate: DateTime.now().add(Duration(days: 2)),
      priority: 2,
    ),
    Task(
      title: 'Prepare Presentation',
      description: 'Create slides for the team meeting',
      status: TaskStatus.pending,
      priority: 2,
    ),
    Task(
      title: 'Car Service',
      description: 'Schedule an appointment for car servicing',
      status: TaskStatus.pending,
      dueDate: DateTime.now().add(Duration(days: 7)),
      priority: 1,
    ),
    Task(
      title: 'Complete Flutter Project',
      description: 'Finish implementing state management',
      status: TaskStatus.inProgress,
      dueDate: DateTime.now().add(Duration(days: 5)),
      priority: 1,
    ),
    Task(
      title: 'Update README',
      description: 'Add instructions for setting up the app',
      status: TaskStatus.inProgress,
      priority: 2,
    ),
    Task(
      title: 'Research New Features',
      description: 'Look into new libraries for the project',
      status: TaskStatus.inProgress,
      priority: 3,
    ),
    Task(
      title: 'Grocery Shopping',
      description: 'Bought vegetables, fruits, and milk',
      status: TaskStatus.completed,
      priority: 3,
      dueDate: DateTime.now().subtract(Duration(days: 1)),
      updatedAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Task(
      title: 'Finalize Budget',
      description: 'Review and finalize the budget for next quarter',
      status: TaskStatus.completed,
      priority: 1,
      dueDate: DateTime.now().subtract(Duration(days: 3)),
      updatedAt: DateTime.now().subtract(Duration(days: 2)),
    ),
    Task(
      title: 'Complete Project Report',
      description: 'Write and submit the final project report',
      status: TaskStatus.completed,
      priority: 2,
      dueDate: DateTime.now().subtract(Duration(days: 5)),
      updatedAt: DateTime.now().subtract(Duration(days: 4)),
    ),
  ];

  void addNewTask(Task task) {
    allTask.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    allTask.remove(task);
    notifyListeners();
  }

  List<Task> getPendingList() {
    List<Task> listOFTask = allTask;
    return listOFTask
        .where((element) => element.status == TaskStatus.pending)
        .toList();
  }

  List<Task> getInProgressList() {
    List<Task> listOFTask = allTask;
    return listOFTask
        .where((element) => element.status == TaskStatus.inProgress)
        .toList();
  }

  List<Task> getCompletedList() {
    List<Task> listOFTask = allTask;
    return listOFTask
        .where((element) => element.status == TaskStatus.completed)
        .toList();
  }
}

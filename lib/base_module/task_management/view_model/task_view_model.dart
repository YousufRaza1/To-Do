import 'package:flutter/cupertino.dart';

import '../model/task_model.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier {
  List<List<Task>> allTaskList = [];

  TaskDataManager dataManager = TaskDataManager();

  void getAllTaskList() async {
    allTaskList = [
      dataManager.getInProgressList(),
      dataManager.getCompletedList(),
      dataManager.getPendingList()
    ];
  }

  void addNewTask(Task task) {
    dataManager.addNewTask(task);
    getAllTaskList();
    notifyListeners();
  }

  void removeATask(Task task) {
    dataManager.removeTask(task);
    getAllTaskList();
    notifyListeners();
  }



  void changeThePriorityOfTask(Task task) {
    int newPriority; // Declare with a type and initialize
    if (task.priority == 3) {
      newPriority = 1; // If priority is 3, set it to 1
    } else {
      newPriority = task.priority + 1; // Increment priority if it's not 3
    }
    task.update(priority: newPriority);
    notifyListeners(); // Notify listeners to update the UI
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red.shade100; // High priority: Light Red
      case 2:
        return Colors.orange.shade100; // Medium priority: Light Orange
      case 3:
        return Colors.green.shade100; // Low priority: Light Green
      default:
        return Colors.grey.shade100; // Default color
    }
  }

  Color getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return Colors.orange;
      case TaskStatus.inProgress:
        return Colors.blue;
      case TaskStatus.completed:
        return Colors.green;
      case TaskStatus.overdue:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}

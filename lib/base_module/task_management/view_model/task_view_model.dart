import 'package:flutter/cupertino.dart';
import 'package:to_do/base_module/task_management/repository/task_repository_impl.dart';
import '../model/task_model.dart';
import 'package:flutter/material.dart';
import '../repository/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  List<List<Task>> allTaskList = [];
  List<Task> allTaskListUnordered = [];
  bool isLoading = false;


  TaskRepository repository = TaskRepositoryImpl();

  void getAllTaskList() async {
    isLoading = true;
    notifyListeners();
    allTaskListUnordered = await repository.getAllTask();
    allTaskList = [getInProgressList(), getCompletedList(), getPendingList()];
    print('yes data fatched');
    isLoading = false;
    notifyListeners();
  }

  List<Task> getInProgressList() {
    List<Task> listOFTask = allTaskListUnordered;
    return listOFTask
        .where((element) => element.status == TaskStatus.inProgress)
        .toList();
  }

  List<Task> getCompletedList() {
    List<Task> listOFTask = allTaskListUnordered;
    return listOFTask
        .where((element) => element.status == TaskStatus.completed)
        .toList();
  }

  List<Task> getPendingList() {
    List<Task> listOFTask = allTaskListUnordered;
    return listOFTask
        .where((element) => element.status == TaskStatus.pending)
        .toList();
  }

  void addNewTask(Task task) {
    repository.addNewTask(task);
    getAllTaskList();
    notifyListeners();
  }

  void removeATask(Task task) async {
    repository.removeTask(task);
  }

  void updateTask(Task task) async {
   await repository.updateTask(task);
    getAllTaskList();
    notifyListeners();
  }

  void changeThePriorityOfTask(Task task) {
    int newPriority;
    if (task.priority == 3) {
      newPriority = 1;
    } else {
      newPriority = task.priority + 1;
    }
    task.update(priority: newPriority);
    repository.updateTask(task);
    notifyListeners();
  }


  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red.shade100;
      case 2:
        return Colors.orange.shade100;
      case 3:
        return Colors.green.shade100;
      default:
        return Colors.grey.shade100;
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



import '../model/task_model.dart';

abstract class TaskRepository {
  Future<void> addNewTask(Task task);
  Future<List<Task>> getAllTask();
  Future<void> removeTask(Task task);
  Future<void> updateTask(Task task);

}

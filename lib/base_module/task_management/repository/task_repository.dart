

import '../model/task_model.dart';

abstract class TaskRepository {
  /// Add a new task to the repository.
  Future<void> addNewTask(Task task);

  /// Retrieve all tasks from the repository.
  Future<List<Task>> getAllTask();

  /// Remove a task from the repository by its ID.
  Future<void> removeTask(Task task);

  /// Update an existing task in the repository.
  Future<void> updateTask(Task task);

}

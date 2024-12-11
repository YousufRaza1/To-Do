import '../model/task_model.dart';
import 'package:flutter/material.dart';
import 'task_repository.dart';
import 'local_data_source.dart';

class TaskRepositoryImpl extends ChangeNotifier implements TaskRepository {
  TaskLocalDataSource localDataSource = TaskLocalDataSource();

  @override
  Future<List<Task>> getAllTask() async {
    return await localDataSource.fetchAllTasks();
  }

  @override
  Future<void> updateTask(Task task) async {
    await localDataSource.updateTask(task);
  }

  Future<void> addNewTask(Task task) async {
    await localDataSource.createTask(task);
  }

  Future<void> removeTask(Task task) async {
    await localDataSource.deleteTask(task.id);
  }
}

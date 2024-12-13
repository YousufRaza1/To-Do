import 'package:drift/drift.dart';
import 'app_database.dart';
import '../../model/task_model.dart';

class TaskLocalDataSource {
  static final TaskLocalDataSource _instance = TaskLocalDataSource._internal();
  factory TaskLocalDataSource() => _instance;

  final AppDatabase _db = AppDatabase();

  TaskLocalDataSource._internal();

  Future<void> createTask(Task task) async {
    await _db.into(_db.driftTasks).insert(DriftTasksCompanion(
      id: Value(task.id),
      title: Value(task.title),
      description: Value(task.description),
      status: Value(task.status.index), // Assuming status is an enum
      dueDate: task.dueDate != null ? Value(task.dueDate!.millisecondsSinceEpoch) : const Value.absent(),
      priority: task.priority != null ? Value(task.priority!) : const Value.absent(),
      createdAt: Value(task.createdAt.millisecondsSinceEpoch),
      updatedAt: task.updatedAt != null ? Value(task.updatedAt!.millisecondsSinceEpoch) : const Value.absent(),
    ));
    print('New task added to database');
  }

  Future<List<Task>> fetchAllTasks() async {
    final taskEntities = await _db.select(_db.driftTasks).get();
    return taskEntities.map((e) => Task(
      id: e.id,
      title: e.title,
      description: e.description?? '',
      status: TaskStatus.values[e.status], // Assuming status is an enum
      dueDate: e.dueDate != null ? DateTime.fromMillisecondsSinceEpoch(e.dueDate!) : null,
      priority: e.priority?? 1,
      createdAt: DateTime.fromMillisecondsSinceEpoch(e.createdAt),
      updatedAt: e.updatedAt != null ? DateTime.fromMillisecondsSinceEpoch(e.updatedAt!) : null,
    )).toList();
  }

  Future<bool> updateTask(Task task) async {
    final rowsUpdated = await (_db.update(_db.driftTasks)
      ..where((tbl) => tbl.id.equals(task.id)))
        .write(DriftTasksCompanion(
      title: Value(task.title),
      description: Value(task.description),
      status: Value(task.status.index),
      dueDate: task.dueDate != null ? Value(task.dueDate!.millisecondsSinceEpoch) : const Value.absent(),
      priority: task.priority != null ? Value(task.priority!) : const Value.absent(),
      updatedAt: Value(task.updatedAt!.millisecondsSinceEpoch),
    ));
    return rowsUpdated > 0;
  }

  Future<bool> deleteTask(String id) async {
    final rowsDeleted = await (_db.delete(_db.driftTasks)..where((tbl) => tbl.id.equals(id))).go();
    return rowsDeleted > 0;
  }

  Future<void> deleteAllTasks() async {
    await _db.delete(_db.driftTasks).go();
    print('All tasks have been deleted');
  }
}

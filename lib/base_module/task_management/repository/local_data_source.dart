import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/task_model.dart';
class TaskLocalDataSource {
  static final TaskLocalDataSource _instance = TaskLocalDataSource._internal();
  factory TaskLocalDataSource() => _instance;

  static Database? _database;

  TaskLocalDataSource._internal();

  // Initialize the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            description TEXT,
            status INTEGER NOT NULL,
            dueDate INTEGER,
            priority INTEGER NOT NULL,
            createdAt INTEGER NOT NULL,
            updatedAt INTEGER
          )
        ''');
      },
    );
  }

  /// **Create a new task**
  Future<void> createTask(Task task) async {
    final db = await database;
    await db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('new task added to database');
  }

  /// **Fetch all tasks**
  Future<List<Task>> fetchAllTasks() async {
    print('database fetch called');
    final db = await database;
    final maps = await db.query('tasks');

    // Convert the List<Map<String, dynamic>> to List<Task>
    return maps.map((taskMap) => Task.fromMap(taskMap)).toList();
  }

  Future<bool> updateTask(Task task) async {
    try {
      final db = await database;

      // Perform the update and check how many rows were affected
      final rowsUpdated = await db.update(
        'tasks',
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      );

      // If at least one row was updated, return true
      if (rowsUpdated > 0) {
        print('Update in database successful');
        return true;
      } else {
        print('No task found with the given ID to update');
        return false;
      }
    } catch (e) {
      // Catch and log any exceptions that occur
      print('Failed to update task in database: $e');
      return false;
    }
  }


  /// **Delete a task by ID**
  Future<bool> deleteTask(String id) async {
    try {
      final db = await database;

      // Perform the delete operation and check how many rows were affected
      final rowsDeleted = await db.delete(
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );

      // If at least one row was deleted, return true
      if (rowsDeleted > 0) {
        print('Task deleted successfully');
        return true;
      } else {
        print('No task found with the given ID to delete');
        return false;
      }
    } catch (e) {
      // Catch and log any exceptions that occur
      print('Failed to delete task: $e');
      return false;
    }
  }

  /// **Delete all tasks**
  Future<void> deleteAllTasks() async {
    final db = await database;
    await db.delete('tasks');
    print('All tasks have been deleted');
  }
}

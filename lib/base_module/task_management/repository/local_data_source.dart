// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../model/task_model.dart';
// class TaskLocalDataSource {
//   static final TaskLocalDataSource _instance = TaskLocalDataSource._internal();
//   factory TaskLocalDataSource() => _instance;
//
//   static Database? _database;
//
//   TaskLocalDataSource._internal();
//
//   // Initialize the database
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'tasks.db');
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE tasks (
//             id TEXT PRIMARY KEY,
//             title TEXT NOT NULL,
//             description TEXT,
//             status INTEGER NOT NULL,
//             dueDate INTEGER,
//             priority INTEGER NOT NULL,
//             createdAt INTEGER NOT NULL,
//             updatedAt INTEGER
//           )
//         ''');
//       },
//     );
//   }
//
//   /// **Create a new task**
//   Future<void> createTask(Task task) async {
//     final db = await database;
//     await db.insert('tasks', task.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   /// **Fetch all tasks**
//   Future<List<Task>> fetchAllTasks() async {
//     final db = await database;
//     final maps = await db.query('tasks');
//
//     // Convert the List<Map<String, dynamic>> to List<Task>
//     return maps.map((taskMap) => Task.fromMap(taskMap)).toList();
//   }
//
//   /// **Update an existing task**
//   Future<void> updateTask(Task task) async {
//     final db = await database;
//     await db.update(
//       'tasks',
//       task.toMap(),
//       where: 'id = ?',
//       whereArgs: [task.id],
//     );
//   }
//
//   /// **Delete a task by ID**
//   Future<void> deleteTask(String id) async {
//     final db = await database;
//     await db.delete(
//       'tasks',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }

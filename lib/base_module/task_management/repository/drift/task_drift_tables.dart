import 'package:drift/drift.dart';

@DataClassName('TaskEntity') // Maps to the generated database model
class DriftTasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  IntColumn get status => integer()();
  IntColumn get dueDate => integer().nullable()();
  IntColumn get priority => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id}; // Define the primary key at the table level
}
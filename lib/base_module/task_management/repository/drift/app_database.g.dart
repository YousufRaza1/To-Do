// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DriftTasksTable extends DriftTasks
    with TableInfo<$DriftTasksTable, TaskEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<int> dueDate = GeneratedColumn<int>(
      'due_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, status, dueDate, priority, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<TaskEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}due_date']),
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $DriftTasksTable createAlias(String alias) {
    return $DriftTasksTable(attachedDatabase, alias);
  }
}

class TaskEntity extends DataClass implements Insertable<TaskEntity> {
  final String id;
  final String title;
  final String? description;
  final int status;
  final int? dueDate;
  final int? priority;
  final int createdAt;
  final int? updatedAt;
  const TaskEntity(
      {required this.id,
      required this.title,
      this.description,
      required this.status,
      this.dueDate,
      this.priority,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<int>(dueDate);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<int>(priority);
    }
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    return map;
  }

  DriftTasksCompanion toCompanion(bool nullToAbsent) {
    return DriftTasksCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status: Value(status),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory TaskEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskEntity(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<int>(json['status']),
      dueDate: serializer.fromJson<int?>(json['dueDate']),
      priority: serializer.fromJson<int?>(json['priority']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<int>(status),
      'dueDate': serializer.toJson<int?>(dueDate),
      'priority': serializer.toJson<int?>(priority),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
    };
  }

  TaskEntity copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          int? status,
          Value<int?> dueDate = const Value.absent(),
          Value<int?> priority = const Value.absent(),
          int? createdAt,
          Value<int?> updatedAt = const Value.absent()}) =>
      TaskEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        status: status ?? this.status,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        priority: priority.present ? priority.value : this.priority,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  TaskEntity copyWithCompanion(DriftTasksCompanion data) {
    return TaskEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      status: data.status.present ? data.status.value : this.status,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      priority: data.priority.present ? data.priority.value : this.priority,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('priority: $priority, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, description, status, dueDate, priority, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.status == this.status &&
          other.dueDate == this.dueDate &&
          other.priority == this.priority &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DriftTasksCompanion extends UpdateCompanion<TaskEntity> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> status;
  final Value<int?> dueDate;
  final Value<int?> priority;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  final Value<int> rowid;
  const DriftTasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.priority = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTasksCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    required int status,
    this.dueDate = const Value.absent(),
    this.priority = const Value.absent(),
    required int createdAt,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        status = Value(status),
        createdAt = Value(createdAt);
  static Insertable<TaskEntity> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? status,
    Expression<int>? dueDate,
    Expression<int>? priority,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
      if (priority != null) 'priority': priority,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftTasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? status,
      Value<int?>? dueDate,
      Value<int?>? priority,
      Value<int>? createdAt,
      Value<int?>? updatedAt,
      Value<int>? rowid}) {
    return DriftTasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<int>(dueDate.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('priority: $priority, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DriftTasksTable driftTasks = $DriftTasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [driftTasks];
}

typedef $$DriftTasksTableCreateCompanionBuilder = DriftTasksCompanion Function({
  required String id,
  required String title,
  Value<String?> description,
  required int status,
  Value<int?> dueDate,
  Value<int?> priority,
  required int createdAt,
  Value<int?> updatedAt,
  Value<int> rowid,
});
typedef $$DriftTasksTableUpdateCompanionBuilder = DriftTasksCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<int> status,
  Value<int?> dueDate,
  Value<int?> priority,
  Value<int> createdAt,
  Value<int?> updatedAt,
  Value<int> rowid,
});

class $$DriftTasksTableFilterComposer
    extends Composer<_$AppDatabase, $DriftTasksTable> {
  $$DriftTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$DriftTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $DriftTasksTable> {
  $$DriftTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DriftTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DriftTasksTable> {
  $$DriftTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DriftTasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DriftTasksTable,
    TaskEntity,
    $$DriftTasksTableFilterComposer,
    $$DriftTasksTableOrderingComposer,
    $$DriftTasksTableAnnotationComposer,
    $$DriftTasksTableCreateCompanionBuilder,
    $$DriftTasksTableUpdateCompanionBuilder,
    (TaskEntity, BaseReferences<_$AppDatabase, $DriftTasksTable, TaskEntity>),
    TaskEntity,
    PrefetchHooks Function()> {
  $$DriftTasksTableTableManager(_$AppDatabase db, $DriftTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<int?> dueDate = const Value.absent(),
            Value<int?> priority = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTasksCompanion(
            id: id,
            title: title,
            description: description,
            status: status,
            dueDate: dueDate,
            priority: priority,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            required int status,
            Value<int?> dueDate = const Value.absent(),
            Value<int?> priority = const Value.absent(),
            required int createdAt,
            Value<int?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTasksCompanion.insert(
            id: id,
            title: title,
            description: description,
            status: status,
            dueDate: dueDate,
            priority: priority,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DriftTasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DriftTasksTable,
    TaskEntity,
    $$DriftTasksTableFilterComposer,
    $$DriftTasksTableOrderingComposer,
    $$DriftTasksTableAnnotationComposer,
    $$DriftTasksTableCreateCompanionBuilder,
    $$DriftTasksTableUpdateCompanionBuilder,
    (TaskEntity, BaseReferences<_$AppDatabase, $DriftTasksTable, TaskEntity>),
    TaskEntity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DriftTasksTableTableManager get driftTasks =>
      $$DriftTasksTableTableManager(_db, _db.driftTasks);
}

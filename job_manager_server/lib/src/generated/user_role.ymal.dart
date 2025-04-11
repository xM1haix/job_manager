/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class UserRole
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  UserRole._({
    this.id,
    required this.name,
    required this.teamId,
    bool? jobCreate,
    bool? jobRead,
    bool? jobUpdate,
    bool? jobDelete,
    bool? stageCreate,
    bool? stageRead,
    bool? stageUpdate,
    bool? stageDelete,
    bool? stageProgressUpdate,
    bool? stageProgressRevoke,
    bool? teamUpdate,
    bool? teamDelete,
    bool? roleCreate,
    bool? roleRead,
    bool? roleUpdate,
    bool? roleDelete,
    bool? teamUserCreate,
    bool? teamUserRead,
    bool? teamUserUpdate,
    bool? teamUserDelete,
  })  : jobCreate = jobCreate ?? false,
        jobRead = jobRead ?? false,
        jobUpdate = jobUpdate ?? false,
        jobDelete = jobDelete ?? false,
        stageCreate = stageCreate ?? false,
        stageRead = stageRead ?? false,
        stageUpdate = stageUpdate ?? false,
        stageDelete = stageDelete ?? false,
        stageProgressUpdate = stageProgressUpdate ?? false,
        stageProgressRevoke = stageProgressRevoke ?? false,
        teamUpdate = teamUpdate ?? false,
        teamDelete = teamDelete ?? false,
        roleCreate = roleCreate ?? false,
        roleRead = roleRead ?? false,
        roleUpdate = roleUpdate ?? false,
        roleDelete = roleDelete ?? false,
        teamUserCreate = teamUserCreate ?? false,
        teamUserRead = teamUserRead ?? false,
        teamUserUpdate = teamUserUpdate ?? false,
        teamUserDelete = teamUserDelete ?? false;

  factory UserRole({
    int? id,
    required String name,
    required int teamId,
    bool? jobCreate,
    bool? jobRead,
    bool? jobUpdate,
    bool? jobDelete,
    bool? stageCreate,
    bool? stageRead,
    bool? stageUpdate,
    bool? stageDelete,
    bool? stageProgressUpdate,
    bool? stageProgressRevoke,
    bool? teamUpdate,
    bool? teamDelete,
    bool? roleCreate,
    bool? roleRead,
    bool? roleUpdate,
    bool? roleDelete,
    bool? teamUserCreate,
    bool? teamUserRead,
    bool? teamUserUpdate,
    bool? teamUserDelete,
  }) = _UserRoleImpl;

  factory UserRole.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRole(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      teamId: jsonSerialization['teamId'] as int,
      jobCreate: jsonSerialization['jobCreate'] as bool,
      jobRead: jsonSerialization['jobRead'] as bool,
      jobUpdate: jsonSerialization['jobUpdate'] as bool,
      jobDelete: jsonSerialization['jobDelete'] as bool,
      stageCreate: jsonSerialization['stageCreate'] as bool,
      stageRead: jsonSerialization['stageRead'] as bool,
      stageUpdate: jsonSerialization['stageUpdate'] as bool,
      stageDelete: jsonSerialization['stageDelete'] as bool,
      stageProgressUpdate: jsonSerialization['stageProgressUpdate'] as bool,
      stageProgressRevoke: jsonSerialization['stageProgressRevoke'] as bool,
      teamUpdate: jsonSerialization['teamUpdate'] as bool,
      teamDelete: jsonSerialization['teamDelete'] as bool,
      roleCreate: jsonSerialization['roleCreate'] as bool,
      roleRead: jsonSerialization['roleRead'] as bool,
      roleUpdate: jsonSerialization['roleUpdate'] as bool,
      roleDelete: jsonSerialization['roleDelete'] as bool,
      teamUserCreate: jsonSerialization['teamUserCreate'] as bool,
      teamUserRead: jsonSerialization['teamUserRead'] as bool,
      teamUserUpdate: jsonSerialization['teamUserUpdate'] as bool,
      teamUserDelete: jsonSerialization['teamUserDelete'] as bool,
    );
  }

  static final t = UserRoleTable();

  static const db = UserRoleRepository._();

  @override
  int? id;

  String name;

  int teamId;

  bool jobCreate;

  bool jobRead;

  bool jobUpdate;

  bool jobDelete;

  bool stageCreate;

  bool stageRead;

  bool stageUpdate;

  bool stageDelete;

  bool stageProgressUpdate;

  bool stageProgressRevoke;

  bool teamUpdate;

  bool teamDelete;

  bool roleCreate;

  bool roleRead;

  bool roleUpdate;

  bool roleDelete;

  bool teamUserCreate;

  bool teamUserRead;

  bool teamUserUpdate;

  bool teamUserDelete;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [UserRole]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserRole copyWith({
    int? id,
    String? name,
    int? teamId,
    bool? jobCreate,
    bool? jobRead,
    bool? jobUpdate,
    bool? jobDelete,
    bool? stageCreate,
    bool? stageRead,
    bool? stageUpdate,
    bool? stageDelete,
    bool? stageProgressUpdate,
    bool? stageProgressRevoke,
    bool? teamUpdate,
    bool? teamDelete,
    bool? roleCreate,
    bool? roleRead,
    bool? roleUpdate,
    bool? roleDelete,
    bool? teamUserCreate,
    bool? teamUserRead,
    bool? teamUserUpdate,
    bool? teamUserDelete,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'teamId': teamId,
      'jobCreate': jobCreate,
      'jobRead': jobRead,
      'jobUpdate': jobUpdate,
      'jobDelete': jobDelete,
      'stageCreate': stageCreate,
      'stageRead': stageRead,
      'stageUpdate': stageUpdate,
      'stageDelete': stageDelete,
      'stageProgressUpdate': stageProgressUpdate,
      'stageProgressRevoke': stageProgressRevoke,
      'teamUpdate': teamUpdate,
      'teamDelete': teamDelete,
      'roleCreate': roleCreate,
      'roleRead': roleRead,
      'roleUpdate': roleUpdate,
      'roleDelete': roleDelete,
      'teamUserCreate': teamUserCreate,
      'teamUserRead': teamUserRead,
      'teamUserUpdate': teamUserUpdate,
      'teamUserDelete': teamUserDelete,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'teamId': teamId,
      'jobCreate': jobCreate,
      'jobRead': jobRead,
      'jobUpdate': jobUpdate,
      'jobDelete': jobDelete,
      'stageCreate': stageCreate,
      'stageRead': stageRead,
      'stageUpdate': stageUpdate,
      'stageDelete': stageDelete,
      'stageProgressUpdate': stageProgressUpdate,
      'stageProgressRevoke': stageProgressRevoke,
      'teamUpdate': teamUpdate,
      'teamDelete': teamDelete,
      'roleCreate': roleCreate,
      'roleRead': roleRead,
      'roleUpdate': roleUpdate,
      'roleDelete': roleDelete,
      'teamUserCreate': teamUserCreate,
      'teamUserRead': teamUserRead,
      'teamUserUpdate': teamUserUpdate,
      'teamUserDelete': teamUserDelete,
    };
  }

  static UserRoleInclude include() {
    return UserRoleInclude._();
  }

  static UserRoleIncludeList includeList({
    _i1.WhereExpressionBuilder<UserRoleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRoleTable>? orderByList,
    UserRoleInclude? include,
  }) {
    return UserRoleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserRole.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserRole.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserRoleImpl extends UserRole {
  _UserRoleImpl({
    int? id,
    required String name,
    required int teamId,
    bool? jobCreate,
    bool? jobRead,
    bool? jobUpdate,
    bool? jobDelete,
    bool? stageCreate,
    bool? stageRead,
    bool? stageUpdate,
    bool? stageDelete,
    bool? stageProgressUpdate,
    bool? stageProgressRevoke,
    bool? teamUpdate,
    bool? teamDelete,
    bool? roleCreate,
    bool? roleRead,
    bool? roleUpdate,
    bool? roleDelete,
    bool? teamUserCreate,
    bool? teamUserRead,
    bool? teamUserUpdate,
    bool? teamUserDelete,
  }) : super._(
          id: id,
          name: name,
          teamId: teamId,
          jobCreate: jobCreate,
          jobRead: jobRead,
          jobUpdate: jobUpdate,
          jobDelete: jobDelete,
          stageCreate: stageCreate,
          stageRead: stageRead,
          stageUpdate: stageUpdate,
          stageDelete: stageDelete,
          stageProgressUpdate: stageProgressUpdate,
          stageProgressRevoke: stageProgressRevoke,
          teamUpdate: teamUpdate,
          teamDelete: teamDelete,
          roleCreate: roleCreate,
          roleRead: roleRead,
          roleUpdate: roleUpdate,
          roleDelete: roleDelete,
          teamUserCreate: teamUserCreate,
          teamUserRead: teamUserRead,
          teamUserUpdate: teamUserUpdate,
          teamUserDelete: teamUserDelete,
        );

  /// Returns a shallow copy of this [UserRole]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserRole copyWith({
    Object? id = _Undefined,
    String? name,
    int? teamId,
    bool? jobCreate,
    bool? jobRead,
    bool? jobUpdate,
    bool? jobDelete,
    bool? stageCreate,
    bool? stageRead,
    bool? stageUpdate,
    bool? stageDelete,
    bool? stageProgressUpdate,
    bool? stageProgressRevoke,
    bool? teamUpdate,
    bool? teamDelete,
    bool? roleCreate,
    bool? roleRead,
    bool? roleUpdate,
    bool? roleDelete,
    bool? teamUserCreate,
    bool? teamUserRead,
    bool? teamUserUpdate,
    bool? teamUserDelete,
  }) {
    return UserRole(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      teamId: teamId ?? this.teamId,
      jobCreate: jobCreate ?? this.jobCreate,
      jobRead: jobRead ?? this.jobRead,
      jobUpdate: jobUpdate ?? this.jobUpdate,
      jobDelete: jobDelete ?? this.jobDelete,
      stageCreate: stageCreate ?? this.stageCreate,
      stageRead: stageRead ?? this.stageRead,
      stageUpdate: stageUpdate ?? this.stageUpdate,
      stageDelete: stageDelete ?? this.stageDelete,
      stageProgressUpdate: stageProgressUpdate ?? this.stageProgressUpdate,
      stageProgressRevoke: stageProgressRevoke ?? this.stageProgressRevoke,
      teamUpdate: teamUpdate ?? this.teamUpdate,
      teamDelete: teamDelete ?? this.teamDelete,
      roleCreate: roleCreate ?? this.roleCreate,
      roleRead: roleRead ?? this.roleRead,
      roleUpdate: roleUpdate ?? this.roleUpdate,
      roleDelete: roleDelete ?? this.roleDelete,
      teamUserCreate: teamUserCreate ?? this.teamUserCreate,
      teamUserRead: teamUserRead ?? this.teamUserRead,
      teamUserUpdate: teamUserUpdate ?? this.teamUserUpdate,
      teamUserDelete: teamUserDelete ?? this.teamUserDelete,
    );
  }
}

class UserRoleTable extends _i1.Table<int> {
  UserRoleTable({super.tableRelation}) : super(tableName: 'roles') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    teamId = _i1.ColumnInt(
      'teamId',
      this,
    );
    jobCreate = _i1.ColumnBool(
      'jobCreate',
      this,
      hasDefault: true,
    );
    jobRead = _i1.ColumnBool(
      'jobRead',
      this,
      hasDefault: true,
    );
    jobUpdate = _i1.ColumnBool(
      'jobUpdate',
      this,
      hasDefault: true,
    );
    jobDelete = _i1.ColumnBool(
      'jobDelete',
      this,
      hasDefault: true,
    );
    stageCreate = _i1.ColumnBool(
      'stageCreate',
      this,
      hasDefault: true,
    );
    stageRead = _i1.ColumnBool(
      'stageRead',
      this,
      hasDefault: true,
    );
    stageUpdate = _i1.ColumnBool(
      'stageUpdate',
      this,
      hasDefault: true,
    );
    stageDelete = _i1.ColumnBool(
      'stageDelete',
      this,
      hasDefault: true,
    );
    stageProgressUpdate = _i1.ColumnBool(
      'stageProgressUpdate',
      this,
      hasDefault: true,
    );
    stageProgressRevoke = _i1.ColumnBool(
      'stageProgressRevoke',
      this,
      hasDefault: true,
    );
    teamUpdate = _i1.ColumnBool(
      'teamUpdate',
      this,
      hasDefault: true,
    );
    teamDelete = _i1.ColumnBool(
      'teamDelete',
      this,
      hasDefault: true,
    );
    roleCreate = _i1.ColumnBool(
      'roleCreate',
      this,
      hasDefault: true,
    );
    roleRead = _i1.ColumnBool(
      'roleRead',
      this,
      hasDefault: true,
    );
    roleUpdate = _i1.ColumnBool(
      'roleUpdate',
      this,
      hasDefault: true,
    );
    roleDelete = _i1.ColumnBool(
      'roleDelete',
      this,
      hasDefault: true,
    );
    teamUserCreate = _i1.ColumnBool(
      'teamUserCreate',
      this,
      hasDefault: true,
    );
    teamUserRead = _i1.ColumnBool(
      'teamUserRead',
      this,
      hasDefault: true,
    );
    teamUserUpdate = _i1.ColumnBool(
      'teamUserUpdate',
      this,
      hasDefault: true,
    );
    teamUserDelete = _i1.ColumnBool(
      'teamUserDelete',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt teamId;

  late final _i1.ColumnBool jobCreate;

  late final _i1.ColumnBool jobRead;

  late final _i1.ColumnBool jobUpdate;

  late final _i1.ColumnBool jobDelete;

  late final _i1.ColumnBool stageCreate;

  late final _i1.ColumnBool stageRead;

  late final _i1.ColumnBool stageUpdate;

  late final _i1.ColumnBool stageDelete;

  late final _i1.ColumnBool stageProgressUpdate;

  late final _i1.ColumnBool stageProgressRevoke;

  late final _i1.ColumnBool teamUpdate;

  late final _i1.ColumnBool teamDelete;

  late final _i1.ColumnBool roleCreate;

  late final _i1.ColumnBool roleRead;

  late final _i1.ColumnBool roleUpdate;

  late final _i1.ColumnBool roleDelete;

  late final _i1.ColumnBool teamUserCreate;

  late final _i1.ColumnBool teamUserRead;

  late final _i1.ColumnBool teamUserUpdate;

  late final _i1.ColumnBool teamUserDelete;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        teamId,
        jobCreate,
        jobRead,
        jobUpdate,
        jobDelete,
        stageCreate,
        stageRead,
        stageUpdate,
        stageDelete,
        stageProgressUpdate,
        stageProgressRevoke,
        teamUpdate,
        teamDelete,
        roleCreate,
        roleRead,
        roleUpdate,
        roleDelete,
        teamUserCreate,
        teamUserRead,
        teamUserUpdate,
        teamUserDelete,
      ];
}

class UserRoleInclude extends _i1.IncludeObject {
  UserRoleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => UserRole.t;
}

class UserRoleIncludeList extends _i1.IncludeList {
  UserRoleIncludeList._({
    _i1.WhereExpressionBuilder<UserRoleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserRole.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => UserRole.t;
}

class UserRoleRepository {
  const UserRoleRepository._();

  /// Returns a list of [UserRole]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<UserRole>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRoleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRoleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserRole>(
      where: where?.call(UserRole.t),
      orderBy: orderBy?.call(UserRole.t),
      orderByList: orderByList?.call(UserRole.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserRole] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<UserRole?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRoleTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserRoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRoleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserRole>(
      where: where?.call(UserRole.t),
      orderBy: orderBy?.call(UserRole.t),
      orderByList: orderByList?.call(UserRole.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserRole] by its [id] or null if no such row exists.
  Future<UserRole?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserRole>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserRole]s in the list and returns the inserted rows.
  ///
  /// The returned [UserRole]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserRole>> insert(
    _i1.Session session,
    List<UserRole> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserRole>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserRole] and returns the inserted row.
  ///
  /// The returned [UserRole] will have its `id` field set.
  Future<UserRole> insertRow(
    _i1.Session session,
    UserRole row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserRole>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserRole]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserRole>> update(
    _i1.Session session,
    List<UserRole> rows, {
    _i1.ColumnSelections<UserRoleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserRole>(
      rows,
      columns: columns?.call(UserRole.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserRole]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserRole> updateRow(
    _i1.Session session,
    UserRole row, {
    _i1.ColumnSelections<UserRoleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserRole>(
      row,
      columns: columns?.call(UserRole.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserRole]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserRole>> delete(
    _i1.Session session,
    List<UserRole> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserRole>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserRole].
  Future<UserRole> deleteRow(
    _i1.Session session,
    UserRole row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserRole>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserRole>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRoleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserRole>(
      where: where(UserRole.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRoleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserRole>(
      where: where?.call(UserRole.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

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

abstract class ServerConfig
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  ServerConfig._({
    this.id,
    required this.key,
    required this.value,
    required this.userId,
  });

  factory ServerConfig({
    int? id,
    required String key,
    required String value,
    required int userId,
  }) = _ServerConfigImpl;

  factory ServerConfig.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerConfig(
      id: jsonSerialization['id'] as int?,
      key: jsonSerialization['key'] as String,
      value: jsonSerialization['value'] as String,
      userId: jsonSerialization['userId'] as int,
    );
  }

  static final t = ServerConfigTable();

  static const db = ServerConfigRepository._();

  @override
  int? id;

  String key;

  String value;

  int userId;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [ServerConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServerConfig copyWith({
    int? id,
    String? key,
    String? value,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'key': key,
      'value': value,
      'userId': userId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'key': key,
      'value': value,
      'userId': userId,
    };
  }

  static ServerConfigInclude include() {
    return ServerConfigInclude._();
  }

  static ServerConfigIncludeList includeList({
    _i1.WhereExpressionBuilder<ServerConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServerConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServerConfigTable>? orderByList,
    ServerConfigInclude? include,
  }) {
    return ServerConfigIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ServerConfig.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ServerConfig.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServerConfigImpl extends ServerConfig {
  _ServerConfigImpl({
    int? id,
    required String key,
    required String value,
    required int userId,
  }) : super._(
          id: id,
          key: key,
          value: value,
          userId: userId,
        );

  /// Returns a shallow copy of this [ServerConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServerConfig copyWith({
    Object? id = _Undefined,
    String? key,
    String? value,
    int? userId,
  }) {
    return ServerConfig(
      id: id is int? ? id : this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      userId: userId ?? this.userId,
    );
  }
}

class ServerConfigTable extends _i1.Table<int> {
  ServerConfigTable({super.tableRelation}) : super(tableName: 'server_config') {
    key = _i1.ColumnString(
      'key',
      this,
    );
    value = _i1.ColumnString(
      'value',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
  }

  late final _i1.ColumnString key;

  late final _i1.ColumnString value;

  late final _i1.ColumnInt userId;

  @override
  List<_i1.Column> get columns => [
        id,
        key,
        value,
        userId,
      ];
}

class ServerConfigInclude extends _i1.IncludeObject {
  ServerConfigInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => ServerConfig.t;
}

class ServerConfigIncludeList extends _i1.IncludeList {
  ServerConfigIncludeList._({
    _i1.WhereExpressionBuilder<ServerConfigTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ServerConfig.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => ServerConfig.t;
}

class ServerConfigRepository {
  const ServerConfigRepository._();

  /// Returns a list of [ServerConfig]s matching the given query parameters.
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
  Future<List<ServerConfig>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServerConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServerConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServerConfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ServerConfig>(
      where: where?.call(ServerConfig.t),
      orderBy: orderBy?.call(ServerConfig.t),
      orderByList: orderByList?.call(ServerConfig.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ServerConfig] matching the given query parameters.
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
  Future<ServerConfig?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServerConfigTable>? where,
    int? offset,
    _i1.OrderByBuilder<ServerConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServerConfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ServerConfig>(
      where: where?.call(ServerConfig.t),
      orderBy: orderBy?.call(ServerConfig.t),
      orderByList: orderByList?.call(ServerConfig.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ServerConfig] by its [id] or null if no such row exists.
  Future<ServerConfig?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ServerConfig>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ServerConfig]s in the list and returns the inserted rows.
  ///
  /// The returned [ServerConfig]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ServerConfig>> insert(
    _i1.Session session,
    List<ServerConfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ServerConfig>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ServerConfig] and returns the inserted row.
  ///
  /// The returned [ServerConfig] will have its `id` field set.
  Future<ServerConfig> insertRow(
    _i1.Session session,
    ServerConfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ServerConfig>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ServerConfig]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ServerConfig>> update(
    _i1.Session session,
    List<ServerConfig> rows, {
    _i1.ColumnSelections<ServerConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ServerConfig>(
      rows,
      columns: columns?.call(ServerConfig.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ServerConfig]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ServerConfig> updateRow(
    _i1.Session session,
    ServerConfig row, {
    _i1.ColumnSelections<ServerConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ServerConfig>(
      row,
      columns: columns?.call(ServerConfig.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ServerConfig]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ServerConfig>> delete(
    _i1.Session session,
    List<ServerConfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ServerConfig>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ServerConfig].
  Future<ServerConfig> deleteRow(
    _i1.Session session,
    ServerConfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ServerConfig>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ServerConfig>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ServerConfigTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ServerConfig>(
      where: where(ServerConfig.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServerConfigTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ServerConfig>(
      where: where?.call(ServerConfig.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

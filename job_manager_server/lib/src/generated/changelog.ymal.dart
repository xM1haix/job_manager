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

abstract class Chnagelog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Chnagelog._({
    this.id,
    required this.version,
    required this.details,
    required this.datetime,
  });

  factory Chnagelog({
    int? id,
    required String version,
    required String details,
    required int datetime,
  }) = _ChnagelogImpl;

  factory Chnagelog.fromJson(Map<String, dynamic> jsonSerialization) {
    return Chnagelog(
      id: jsonSerialization['id'] as int?,
      version: jsonSerialization['version'] as String,
      details: jsonSerialization['details'] as String,
      datetime: jsonSerialization['datetime'] as int,
    );
  }

  static final t = ChnagelogTable();

  static const db = ChnagelogRepository._();

  @override
  int? id;

  String version;

  String details;

  int datetime;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Chnagelog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Chnagelog copyWith({
    int? id,
    String? version,
    String? details,
    int? datetime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'version': version,
      'details': details,
      'datetime': datetime,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'version': version,
      'details': details,
      'datetime': datetime,
    };
  }

  static ChnagelogInclude include() {
    return ChnagelogInclude._();
  }

  static ChnagelogIncludeList includeList({
    _i1.WhereExpressionBuilder<ChnagelogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChnagelogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChnagelogTable>? orderByList,
    ChnagelogInclude? include,
  }) {
    return ChnagelogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Chnagelog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Chnagelog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChnagelogImpl extends Chnagelog {
  _ChnagelogImpl({
    int? id,
    required String version,
    required String details,
    required int datetime,
  }) : super._(
          id: id,
          version: version,
          details: details,
          datetime: datetime,
        );

  /// Returns a shallow copy of this [Chnagelog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Chnagelog copyWith({
    Object? id = _Undefined,
    String? version,
    String? details,
    int? datetime,
  }) {
    return Chnagelog(
      id: id is int? ? id : this.id,
      version: version ?? this.version,
      details: details ?? this.details,
      datetime: datetime ?? this.datetime,
    );
  }
}

class ChnagelogTable extends _i1.Table<int?> {
  ChnagelogTable({super.tableRelation}) : super(tableName: 'changelog') {
    version = _i1.ColumnString(
      'version',
      this,
    );
    details = _i1.ColumnString(
      'details',
      this,
    );
    datetime = _i1.ColumnInt(
      'datetime',
      this,
    );
  }

  late final _i1.ColumnString version;

  late final _i1.ColumnString details;

  late final _i1.ColumnInt datetime;

  @override
  List<_i1.Column> get columns => [
        id,
        version,
        details,
        datetime,
      ];
}

class ChnagelogInclude extends _i1.IncludeObject {
  ChnagelogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Chnagelog.t;
}

class ChnagelogIncludeList extends _i1.IncludeList {
  ChnagelogIncludeList._({
    _i1.WhereExpressionBuilder<ChnagelogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Chnagelog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Chnagelog.t;
}

class ChnagelogRepository {
  const ChnagelogRepository._();

  /// Returns a list of [Chnagelog]s matching the given query parameters.
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
  Future<List<Chnagelog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChnagelogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChnagelogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChnagelogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Chnagelog>(
      where: where?.call(Chnagelog.t),
      orderBy: orderBy?.call(Chnagelog.t),
      orderByList: orderByList?.call(Chnagelog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Chnagelog] matching the given query parameters.
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
  Future<Chnagelog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChnagelogTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChnagelogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChnagelogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Chnagelog>(
      where: where?.call(Chnagelog.t),
      orderBy: orderBy?.call(Chnagelog.t),
      orderByList: orderByList?.call(Chnagelog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Chnagelog] by its [id] or null if no such row exists.
  Future<Chnagelog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Chnagelog>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Chnagelog]s in the list and returns the inserted rows.
  ///
  /// The returned [Chnagelog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Chnagelog>> insert(
    _i1.Session session,
    List<Chnagelog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Chnagelog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Chnagelog] and returns the inserted row.
  ///
  /// The returned [Chnagelog] will have its `id` field set.
  Future<Chnagelog> insertRow(
    _i1.Session session,
    Chnagelog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Chnagelog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Chnagelog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Chnagelog>> update(
    _i1.Session session,
    List<Chnagelog> rows, {
    _i1.ColumnSelections<ChnagelogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Chnagelog>(
      rows,
      columns: columns?.call(Chnagelog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Chnagelog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Chnagelog> updateRow(
    _i1.Session session,
    Chnagelog row, {
    _i1.ColumnSelections<ChnagelogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Chnagelog>(
      row,
      columns: columns?.call(Chnagelog.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Chnagelog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Chnagelog>> delete(
    _i1.Session session,
    List<Chnagelog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Chnagelog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Chnagelog].
  Future<Chnagelog> deleteRow(
    _i1.Session session,
    Chnagelog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Chnagelog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Chnagelog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ChnagelogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Chnagelog>(
      where: where(Chnagelog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChnagelogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Chnagelog>(
      where: where?.call(Chnagelog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

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

abstract class BugReport
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BugReport._({
    this.id,
    this.userId,
    required this.title,
    required this.details,
  });

  factory BugReport({
    int? id,
    int? userId,
    required String title,
    required String details,
  }) = _BugReportImpl;

  factory BugReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return BugReport(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      title: jsonSerialization['title'] as String,
      details: jsonSerialization['details'] as String,
    );
  }

  static final t = BugReportTable();

  static const db = BugReportRepository._();

  @override
  int? id;

  int? userId;

  String title;

  String details;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BugReport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BugReport copyWith({
    int? id,
    int? userId,
    String? title,
    String? details,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'title': title,
      'details': details,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'title': title,
      'details': details,
    };
  }

  static BugReportInclude include() {
    return BugReportInclude._();
  }

  static BugReportIncludeList includeList({
    _i1.WhereExpressionBuilder<BugReportTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BugReportTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BugReportTable>? orderByList,
    BugReportInclude? include,
  }) {
    return BugReportIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BugReport.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BugReport.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BugReportImpl extends BugReport {
  _BugReportImpl({
    int? id,
    int? userId,
    required String title,
    required String details,
  }) : super._(
          id: id,
          userId: userId,
          title: title,
          details: details,
        );

  /// Returns a shallow copy of this [BugReport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BugReport copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    String? title,
    String? details,
  }) {
    return BugReport(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      title: title ?? this.title,
      details: details ?? this.details,
    );
  }
}

class BugReportTable extends _i1.Table<int?> {
  BugReportTable({super.tableRelation}) : super(tableName: 'bug_report') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    details = _i1.ColumnString(
      'details',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString details;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        title,
        details,
      ];
}

class BugReportInclude extends _i1.IncludeObject {
  BugReportInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BugReport.t;
}

class BugReportIncludeList extends _i1.IncludeList {
  BugReportIncludeList._({
    _i1.WhereExpressionBuilder<BugReportTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BugReport.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BugReport.t;
}

class BugReportRepository {
  const BugReportRepository._();

  /// Returns a list of [BugReport]s matching the given query parameters.
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
  Future<List<BugReport>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BugReportTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BugReportTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BugReportTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BugReport>(
      where: where?.call(BugReport.t),
      orderBy: orderBy?.call(BugReport.t),
      orderByList: orderByList?.call(BugReport.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BugReport] matching the given query parameters.
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
  Future<BugReport?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BugReportTable>? where,
    int? offset,
    _i1.OrderByBuilder<BugReportTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BugReportTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BugReport>(
      where: where?.call(BugReport.t),
      orderBy: orderBy?.call(BugReport.t),
      orderByList: orderByList?.call(BugReport.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BugReport] by its [id] or null if no such row exists.
  Future<BugReport?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BugReport>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BugReport]s in the list and returns the inserted rows.
  ///
  /// The returned [BugReport]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BugReport>> insert(
    _i1.Session session,
    List<BugReport> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BugReport>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BugReport] and returns the inserted row.
  ///
  /// The returned [BugReport] will have its `id` field set.
  Future<BugReport> insertRow(
    _i1.Session session,
    BugReport row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BugReport>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BugReport]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BugReport>> update(
    _i1.Session session,
    List<BugReport> rows, {
    _i1.ColumnSelections<BugReportTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BugReport>(
      rows,
      columns: columns?.call(BugReport.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BugReport]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BugReport> updateRow(
    _i1.Session session,
    BugReport row, {
    _i1.ColumnSelections<BugReportTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BugReport>(
      row,
      columns: columns?.call(BugReport.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BugReport]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BugReport>> delete(
    _i1.Session session,
    List<BugReport> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BugReport>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BugReport].
  Future<BugReport> deleteRow(
    _i1.Session session,
    BugReport row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BugReport>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BugReport>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BugReportTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BugReport>(
      where: where(BugReport.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BugReportTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BugReport>(
      where: where?.call(BugReport.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

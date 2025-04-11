/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class BugReport implements _i1.SerializableModel {
  BugReport._({
    this.id,
    required this.title,
    required this.details,
  });

  factory BugReport({
    int? id,
    required String title,
    required String details,
  }) = _BugReportImpl;

  factory BugReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return BugReport(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      details: jsonSerialization['details'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String details;

  /// Returns a shallow copy of this [BugReport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BugReport copyWith({
    int? id,
    String? title,
    String? details,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'details': details,
    };
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
    required String title,
    required String details,
  }) : super._(
          id: id,
          title: title,
          details: details,
        );

  /// Returns a shallow copy of this [BugReport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BugReport copyWith({
    Object? id = _Undefined,
    String? title,
    String? details,
  }) {
    return BugReport(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      details: details ?? this.details,
    );
  }
}

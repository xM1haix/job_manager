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

abstract class Chnagelog implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String version;

  String details;

  int datetime;

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

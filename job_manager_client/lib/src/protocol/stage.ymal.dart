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

abstract class Stage implements _i1.SerializableModel {
  Stage._({
    this.id,
    required this.name,
    bool? status,
    required this.jobId,
  }) : status = status ?? false;

  factory Stage({
    int? id,
    required String name,
    bool? status,
    required int jobId,
  }) = _StageImpl;

  factory Stage.fromJson(Map<String, dynamic> jsonSerialization) {
    return Stage(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      status: jsonSerialization['status'] as bool,
      jobId: jsonSerialization['jobId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  bool status;

  int jobId;

  /// Returns a shallow copy of this [Stage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Stage copyWith({
    int? id,
    String? name,
    bool? status,
    int? jobId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'status': status,
      'jobId': jobId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StageImpl extends Stage {
  _StageImpl({
    int? id,
    required String name,
    bool? status,
    required int jobId,
  }) : super._(
          id: id,
          name: name,
          status: status,
          jobId: jobId,
        );

  /// Returns a shallow copy of this [Stage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Stage copyWith({
    Object? id = _Undefined,
    String? name,
    bool? status,
    int? jobId,
  }) {
    return Stage(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      jobId: jobId ?? this.jobId,
    );
  }
}

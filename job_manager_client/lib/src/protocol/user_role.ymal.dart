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

abstract class UserRole implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

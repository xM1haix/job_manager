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

abstract class TeamUser implements _i1.SerializableModel {
  TeamUser._({
    this.id,
    required this.teamId,
    required this.userId,
    required this.roleId,
  });

  factory TeamUser({
    int? id,
    required int teamId,
    required int userId,
    required int roleId,
  }) = _TeamUserImpl;

  factory TeamUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return TeamUser(
      id: jsonSerialization['id'] as int?,
      teamId: jsonSerialization['teamId'] as int,
      userId: jsonSerialization['userId'] as int,
      roleId: jsonSerialization['roleId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int teamId;

  int userId;

  int roleId;

  /// Returns a shallow copy of this [TeamUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TeamUser copyWith({
    int? id,
    int? teamId,
    int? userId,
    int? roleId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'teamId': teamId,
      'userId': userId,
      'roleId': roleId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeamUserImpl extends TeamUser {
  _TeamUserImpl({
    int? id,
    required int teamId,
    required int userId,
    required int roleId,
  }) : super._(
          id: id,
          teamId: teamId,
          userId: userId,
          roleId: roleId,
        );

  /// Returns a shallow copy of this [TeamUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TeamUser copyWith({
    Object? id = _Undefined,
    int? teamId,
    int? userId,
    int? roleId,
  }) {
    return TeamUser(
      id: id is int? ? id : this.id,
      teamId: teamId ?? this.teamId,
      userId: userId ?? this.userId,
      roleId: roleId ?? this.roleId,
    );
  }
}

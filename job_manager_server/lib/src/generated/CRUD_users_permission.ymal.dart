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

abstract class CRUDUsersPermission
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CRUDUsersPermission._({
    required this.teamUserCreate,
    required this.teamUserRead,
    required this.teamUserUpdate,
    required this.teamUserDelete,
  });

  factory CRUDUsersPermission({
    required bool teamUserCreate,
    required bool teamUserRead,
    required bool teamUserUpdate,
    required bool teamUserDelete,
  }) = _CRUDUsersPermissionImpl;

  factory CRUDUsersPermission.fromJson(Map<String, dynamic> jsonSerialization) {
    return CRUDUsersPermission(
      teamUserCreate: jsonSerialization['teamUserCreate'] as bool,
      teamUserRead: jsonSerialization['teamUserRead'] as bool,
      teamUserUpdate: jsonSerialization['teamUserUpdate'] as bool,
      teamUserDelete: jsonSerialization['teamUserDelete'] as bool,
    );
  }

  bool teamUserCreate;

  bool teamUserRead;

  bool teamUserUpdate;

  bool teamUserDelete;

  /// Returns a shallow copy of this [CRUDUsersPermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CRUDUsersPermission copyWith({
    bool? teamUserCreate,
    bool? teamUserRead,
    bool? teamUserUpdate,
    bool? teamUserDelete,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'teamUserCreate': teamUserCreate,
      'teamUserRead': teamUserRead,
      'teamUserUpdate': teamUserUpdate,
      'teamUserDelete': teamUserDelete,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
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

class _CRUDUsersPermissionImpl extends CRUDUsersPermission {
  _CRUDUsersPermissionImpl({
    required bool teamUserCreate,
    required bool teamUserRead,
    required bool teamUserUpdate,
    required bool teamUserDelete,
  }) : super._(
          teamUserCreate: teamUserCreate,
          teamUserRead: teamUserRead,
          teamUserUpdate: teamUserUpdate,
          teamUserDelete: teamUserDelete,
        );

  /// Returns a shallow copy of this [CRUDUsersPermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CRUDUsersPermission copyWith({
    bool? teamUserCreate,
    bool? teamUserRead,
    bool? teamUserUpdate,
    bool? teamUserDelete,
  }) {
    return CRUDUsersPermission(
      teamUserCreate: teamUserCreate ?? this.teamUserCreate,
      teamUserRead: teamUserRead ?? this.teamUserRead,
      teamUserUpdate: teamUserUpdate ?? this.teamUserUpdate,
      teamUserDelete: teamUserDelete ?? this.teamUserDelete,
    );
  }
}

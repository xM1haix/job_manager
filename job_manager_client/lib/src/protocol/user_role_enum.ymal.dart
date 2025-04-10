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

enum UserRoleEnum implements _i1.SerializableModel {
  jobCreate,
  jobRead,
  jobUpdate,
  jobDelete,
  stageCreate,
  stageRead,
  stageUpdate,
  stageDelete,
  teamUpdate,
  teamDelete,
  roleCreate,
  roleRead,
  roleUpdate,
  roleDelete,
  teamUserCreate,
  teamUserRead,
  teamUserUpdate,
  teamUserDelete;

  static UserRoleEnum fromJson(String name) {
    switch (name) {
      case 'jobCreate':
        return UserRoleEnum.jobCreate;
      case 'jobRead':
        return UserRoleEnum.jobRead;
      case 'jobUpdate':
        return UserRoleEnum.jobUpdate;
      case 'jobDelete':
        return UserRoleEnum.jobDelete;
      case 'stageCreate':
        return UserRoleEnum.stageCreate;
      case 'stageRead':
        return UserRoleEnum.stageRead;
      case 'stageUpdate':
        return UserRoleEnum.stageUpdate;
      case 'stageDelete':
        return UserRoleEnum.stageDelete;
      case 'teamUpdate':
        return UserRoleEnum.teamUpdate;
      case 'teamDelete':
        return UserRoleEnum.teamDelete;
      case 'roleCreate':
        return UserRoleEnum.roleCreate;
      case 'roleRead':
        return UserRoleEnum.roleRead;
      case 'roleUpdate':
        return UserRoleEnum.roleUpdate;
      case 'roleDelete':
        return UserRoleEnum.roleDelete;
      case 'teamUserCreate':
        return UserRoleEnum.teamUserCreate;
      case 'teamUserRead':
        return UserRoleEnum.teamUserRead;
      case 'teamUserUpdate':
        return UserRoleEnum.teamUserUpdate;
      case 'teamUserDelete':
        return UserRoleEnum.teamUserDelete;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "UserRoleEnum"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}

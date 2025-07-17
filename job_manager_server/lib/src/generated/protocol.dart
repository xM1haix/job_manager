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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'CRUD_users_permission.ymal.dart' as _i4;
import 'bug_report.ymal.dart' as _i5;
import 'changelog.ymal.dart' as _i6;
import 'config.ymal.dart' as _i7;
import 'custom_exception.ymal.dart' as _i8;
import 'job.ymal.dart' as _i9;
import 'stage.ymal.dart' as _i10;
import 'stage_perms.ymal.dart' as _i11;
import 'stage_view.ymal.dart' as _i12;
import 'team.ymal.dart' as _i13;
import 'team_user.ymal.dart' as _i14;
import 'user_role.ymal.dart' as _i15;
import 'user_role_enum.ymal.dart' as _i16;
import 'user_settings.ymal.dart' as _i17;
import 'package:job_manager_server/src/generated/job.ymal.dart' as _i18;
import 'package:job_manager_server/src/generated/team.ymal.dart' as _i19;
export 'CRUD_users_permission.ymal.dart';
export 'bug_report.ymal.dart';
export 'changelog.ymal.dart';
export 'config.ymal.dart';
export 'custom_exception.ymal.dart';
export 'job.ymal.dart';
export 'stage.ymal.dart';
export 'stage_perms.ymal.dart';
export 'stage_view.ymal.dart';
export 'team.ymal.dart';
export 'team_user.ymal.dart';
export 'user_role.ymal.dart';
export 'user_role_enum.ymal.dart';
export 'user_settings.ymal.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'bug_report',
      dartName: 'BugReport',
      schema: 'public',
      module: 'job_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'bug_report_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'details',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'bug_report_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'bug_report_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'changelog',
      dartName: 'Chnagelog',
      schema: 'public',
      module: 'job_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'changelog_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'details',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'datetime',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'changelog_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'jobs',
      dartName: 'Job',
      schema: 'public',
      module: 'job_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'jobs_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'teamId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'jobs_fk_0',
          columns: ['teamId'],
          referenceTable: 'teams',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'jobs_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'roles',
      dartName: 'UserRole',
      schema: 'public',
      module: 'job_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'roles_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'teamId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'jobCreate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'jobRead',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'jobUpdate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'jobDelete',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'stageCreate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'stageRead',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'stageUpdate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'stageDelete',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'stageProgressUpdate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'stageProgressRevoke',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'teamUpdate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'teamDelete',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'roleCreate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'roleRead',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'roleUpdate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'roleDelete',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'teamUserCreate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'teamUserRead',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'teamUserUpdate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'teamUserDelete',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'roles_fk_0',
          columns: ['teamId'],
          referenceTable: 'teams',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'roles_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'server_config',
      dartName: 'ServerConfig',
      schema: 'public',
      module: 'job_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'server_config_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'key',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'server_config_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'server_config_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'stages',
      dartName: 'Stage',
      schema: 'public',
      module: 'job_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'stages_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'jobId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'stages_fk_0',
          columns: ['jobId'],
          referenceTable: 'jobs',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'stages_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'team_users',
      dartName: 'TeamUser',
      schema: 'public',
      module: 'job_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'team_users_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'teamId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'roleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'team_users_fk_0',
          columns: ['teamId'],
          referenceTable: 'teams',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'team_users_fk_1',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'team_users_fk_2',
          columns: ['roleId'],
          referenceTable: 'roles',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'team_users_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'team_user_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'teamId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'teams',
      dartName: 'Team',
      schema: 'public',
      module: 'job_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'teams_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'teams_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.CRUDUsersPermission) {
      return _i4.CRUDUsersPermission.fromJson(data) as T;
    }
    if (t == _i5.BugReport) {
      return _i5.BugReport.fromJson(data) as T;
    }
    if (t == _i6.Chnagelog) {
      return _i6.Chnagelog.fromJson(data) as T;
    }
    if (t == _i7.ServerConfig) {
      return _i7.ServerConfig.fromJson(data) as T;
    }
    if (t == _i8.CustomException) {
      return _i8.CustomException.fromJson(data) as T;
    }
    if (t == _i9.Job) {
      return _i9.Job.fromJson(data) as T;
    }
    if (t == _i10.Stage) {
      return _i10.Stage.fromJson(data) as T;
    }
    if (t == _i11.StagePerms) {
      return _i11.StagePerms.fromJson(data) as T;
    }
    if (t == _i12.StageView) {
      return _i12.StageView.fromJson(data) as T;
    }
    if (t == _i13.Team) {
      return _i13.Team.fromJson(data) as T;
    }
    if (t == _i14.TeamUser) {
      return _i14.TeamUser.fromJson(data) as T;
    }
    if (t == _i15.UserRole) {
      return _i15.UserRole.fromJson(data) as T;
    }
    if (t == _i16.UserRoleEnum) {
      return _i16.UserRoleEnum.fromJson(data) as T;
    }
    if (t == _i17.UserSettings) {
      return _i17.UserSettings.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.CRUDUsersPermission?>()) {
      return (data != null ? _i4.CRUDUsersPermission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.BugReport?>()) {
      return (data != null ? _i5.BugReport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Chnagelog?>()) {
      return (data != null ? _i6.Chnagelog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ServerConfig?>()) {
      return (data != null ? _i7.ServerConfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CustomException?>()) {
      return (data != null ? _i8.CustomException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Job?>()) {
      return (data != null ? _i9.Job.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Stage?>()) {
      return (data != null ? _i10.Stage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.StagePerms?>()) {
      return (data != null ? _i11.StagePerms.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.StageView?>()) {
      return (data != null ? _i12.StageView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Team?>()) {
      return (data != null ? _i13.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.TeamUser?>()) {
      return (data != null ? _i14.TeamUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.UserRole?>()) {
      return (data != null ? _i15.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.UserRoleEnum?>()) {
      return (data != null ? _i16.UserRoleEnum.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.UserSettings?>()) {
      return (data != null ? _i17.UserSettings.fromJson(data) : null) as T;
    }
    if (t == List<_i10.Stage>) {
      return (data as List).map((e) => deserialize<_i10.Stage>(e)).toList()
          as T;
    }
    if (t == List<_i18.Job>) {
      return (data as List).map((e) => deserialize<_i18.Job>(e)).toList() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i19.Team>) {
      return (data as List).map((e) => deserialize<_i19.Team>(e)).toList() as T;
    }
    if (t == List<_i3.UserInfo>) {
      return (data as List).map((e) => deserialize<_i3.UserInfo>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.CRUDUsersPermission) {
      return 'CRUDUsersPermission';
    }
    if (data is _i5.BugReport) {
      return 'BugReport';
    }
    if (data is _i6.Chnagelog) {
      return 'Chnagelog';
    }
    if (data is _i7.ServerConfig) {
      return 'ServerConfig';
    }
    if (data is _i8.CustomException) {
      return 'CustomException';
    }
    if (data is _i9.Job) {
      return 'Job';
    }
    if (data is _i10.Stage) {
      return 'Stage';
    }
    if (data is _i11.StagePerms) {
      return 'StagePerms';
    }
    if (data is _i12.StageView) {
      return 'StageView';
    }
    if (data is _i13.Team) {
      return 'Team';
    }
    if (data is _i14.TeamUser) {
      return 'TeamUser';
    }
    if (data is _i15.UserRole) {
      return 'UserRole';
    }
    if (data is _i16.UserRoleEnum) {
      return 'UserRoleEnum';
    }
    if (data is _i17.UserSettings) {
      return 'UserSettings';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CRUDUsersPermission') {
      return deserialize<_i4.CRUDUsersPermission>(data['data']);
    }
    if (dataClassName == 'BugReport') {
      return deserialize<_i5.BugReport>(data['data']);
    }
    if (dataClassName == 'Chnagelog') {
      return deserialize<_i6.Chnagelog>(data['data']);
    }
    if (dataClassName == 'ServerConfig') {
      return deserialize<_i7.ServerConfig>(data['data']);
    }
    if (dataClassName == 'CustomException') {
      return deserialize<_i8.CustomException>(data['data']);
    }
    if (dataClassName == 'Job') {
      return deserialize<_i9.Job>(data['data']);
    }
    if (dataClassName == 'Stage') {
      return deserialize<_i10.Stage>(data['data']);
    }
    if (dataClassName == 'StagePerms') {
      return deserialize<_i11.StagePerms>(data['data']);
    }
    if (dataClassName == 'StageView') {
      return deserialize<_i12.StageView>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i13.Team>(data['data']);
    }
    if (dataClassName == 'TeamUser') {
      return deserialize<_i14.TeamUser>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i15.UserRole>(data['data']);
    }
    if (dataClassName == 'UserRoleEnum') {
      return deserialize<_i16.UserRoleEnum>(data['data']);
    }
    if (dataClassName == 'UserSettings') {
      return deserialize<_i17.UserSettings>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.BugReport:
        return _i5.BugReport.t;
      case _i6.Chnagelog:
        return _i6.Chnagelog.t;
      case _i7.ServerConfig:
        return _i7.ServerConfig.t;
      case _i9.Job:
        return _i9.Job.t;
      case _i10.Stage:
        return _i10.Stage.t;
      case _i13.Team:
        return _i13.Team.t;
      case _i14.TeamUser:
        return _i14.TeamUser.t;
      case _i15.UserRole:
        return _i15.UserRole.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'job_manager';
}

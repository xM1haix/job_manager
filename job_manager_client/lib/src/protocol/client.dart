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
import 'dart:async' as _i2;
import 'package:job_manager_client/src/protocol/job.ymal.dart' as _i3;
import 'package:job_manager_client/src/protocol/stage.ymal.dart' as _i4;
import 'package:job_manager_client/src/protocol/stage_view.ymal.dart' as _i5;
import 'package:job_manager_client/src/protocol/user_role_enum.ymal.dart'
    as _i6;
import 'package:job_manager_client/src/protocol/CRUD_users_permission.ymal.dart'
    as _i7;
import 'package:job_manager_client/src/protocol/team.ymal.dart' as _i8;
import 'package:job_manager_client/src/protocol/user_settings.ymal.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
import 'protocol.dart' as _i11;

/// {@category Endpoint}
class EndpointJobs extends _i1.EndpointRef {
  EndpointJobs(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jobs';

  _i2.Future<bool> create(
    int teamId,
    String name,
  ) =>
      caller.callServerEndpoint<bool>(
        'jobs',
        'create',
        {
          'teamId': teamId,
          'name': name,
        },
      );

  _i2.Future<List<_i3.Job>> readJobs(int teamId) =>
      caller.callServerEndpoint<List<_i3.Job>>(
        'jobs',
        'readJobs',
        {'teamId': teamId},
      );

  _i2.Future<String> readNameOnly(
    int teamId,
    int id,
  ) =>
      caller.callServerEndpoint<String>(
        'jobs',
        'readNameOnly',
        {
          'teamId': teamId,
          'id': id,
        },
      );
}

/// {@category Endpoint}
class EndpointStages extends _i1.EndpointRef {
  EndpointStages(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'stages';

  _i2.Future<bool> check(
    int teamId,
    int jobId,
    _i4.Stage stage,
  ) =>
      caller.callServerEndpoint<bool>(
        'stages',
        'check',
        {
          'teamId': teamId,
          'jobId': jobId,
          'stage': stage,
        },
      );

  _i2.Future<bool> create(
    int teamId,
    int jobId,
    String name,
  ) =>
      caller.callServerEndpoint<bool>(
        'stages',
        'create',
        {
          'teamId': teamId,
          'jobId': jobId,
          'name': name,
        },
      );

  _i2.Future<bool> delete(
    int teamId,
    int jobId,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'stages',
        'delete',
        {
          'teamId': teamId,
          'jobId': jobId,
          'id': id,
        },
      );

  _i2.Future<_i5.StageView> readStages(
    int teamId,
    int jobId,
  ) =>
      caller.callServerEndpoint<_i5.StageView>(
        'stages',
        'readStages',
        {
          'teamId': teamId,
          'jobId': jobId,
        },
      );
}

/// {@category Endpoint}
class EndpointTeams extends _i1.EndpointRef {
  EndpointTeams(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'teams';

  _i2.Future<bool> addUser(
    int id,
    int userId,
  ) =>
      caller.callServerEndpoint<bool>(
        'teams',
        'addUser',
        {
          'id': id,
          'userId': userId,
        },
      );

  _i2.Future<bool> checkPerms(
    int id,
    _i6.UserRoleEnum userRoleEnum,
  ) =>
      caller.callServerEndpoint<bool>(
        'teams',
        'checkPerms',
        {
          'id': id,
          'userRoleEnum': userRoleEnum,
        },
      );

  _i2.Future<bool> create(String name) => caller.callServerEndpoint<bool>(
        'teams',
        'create',
        {'name': name},
      );

  _i2.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
        'teams',
        'delete',
        {'id': id},
      );

  _i2.Future<_i7.CRUDUsersPermission> getCRUDUsers(int id) =>
      caller.callServerEndpoint<_i7.CRUDUsersPermission>(
        'teams',
        'getCRUDUsers',
        {'id': id},
      );

  _i2.Future<List<int>> getTheUserList(int id) =>
      caller.callServerEndpoint<List<int>>(
        'teams',
        'getTheUserList',
        {'id': id},
      );

  _i2.Future<_i8.Team> read(int id) => caller.callServerEndpoint<_i8.Team>(
        'teams',
        'read',
        {'id': id},
      );

  _i2.Future<List<_i8.Team>> readList(String? seach) =>
      caller.callServerEndpoint<List<_i8.Team>>(
        'teams',
        'readList',
        {'seach': seach},
      );

  _i2.Future<String> readNameOnly(int id) => caller.callServerEndpoint<String>(
        'teams',
        'readNameOnly',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointUserInfo extends _i1.EndpointRef {
  EndpointUserInfo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userInfo';

  _i2.Future<String> checkIfEmailIsFree(String email) =>
      caller.callServerEndpoint<String>(
        'userInfo',
        'checkIfEmailIsFree',
        {'email': email},
      );

  _i2.Future<String> getUsername() => caller.callServerEndpoint<String>(
        'userInfo',
        'getUsername',
        {},
      );

  _i2.Future<_i9.UserSettings> getUserSettings() =>
      caller.callServerEndpoint<_i9.UserSettings>(
        'userInfo',
        'getUserSettings',
        {},
      );

  _i2.Future<List<_i10.UserInfo>> searchByName(String key) =>
      caller.callServerEndpoint<List<_i10.UserInfo>>(
        'userInfo',
        'searchByName',
        {'key': key},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i10.Caller(client);
  }

  late final _i10.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i11.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    jobs = EndpointJobs(this);
    stages = EndpointStages(this);
    teams = EndpointTeams(this);
    userInfo = EndpointUserInfo(this);
    modules = Modules(this);
  }

  late final EndpointJobs jobs;

  late final EndpointStages stages;

  late final EndpointTeams teams;

  late final EndpointUserInfo userInfo;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'jobs': jobs,
        'stages': stages,
        'teams': teams,
        'userInfo': userInfo,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}

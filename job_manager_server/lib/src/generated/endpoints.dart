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
import '../endpoints/jobs_endpoint.dart' as _i2;
import '../endpoints/stages_endpoint.dart' as _i3;
import '../endpoints/teams_endpoints.dart' as _i4;
import '../endpoints/user_data_endpoints.dart' as _i5;
import 'package:job_manager_server/src/generated/stage.ymal.dart' as _i6;
import 'package:job_manager_server/src/generated/user_role_enum.ymal.dart'
    as _i7;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'jobs': _i2.JobsEndpoint()
        ..initialize(
          server,
          'jobs',
          null,
        ),
      'stages': _i3.StagesEndpoint()
        ..initialize(
          server,
          'stages',
          null,
        ),
      'teams': _i4.TeamsEndpoint()
        ..initialize(
          server,
          'teams',
          null,
        ),
      'userInfo': _i5.UserInfoEndpoint()
        ..initialize(
          server,
          'userInfo',
          null,
        ),
    };
    connectors['jobs'] = _i1.EndpointConnector(
      name: 'jobs',
      endpoint: endpoints['jobs']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['jobs'] as _i2.JobsEndpoint).create(
            session,
            params['teamId'],
            params['name'],
          ),
        ),
        'readJobs': _i1.MethodConnector(
          name: 'readJobs',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['jobs'] as _i2.JobsEndpoint).readJobs(
            session,
            params['teamId'],
          ),
        ),
        'readNameOnly': _i1.MethodConnector(
          name: 'readNameOnly',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['jobs'] as _i2.JobsEndpoint).readNameOnly(
            session,
            params['teamId'],
            params['id'],
          ),
        ),
      },
    );
    connectors['stages'] = _i1.EndpointConnector(
      name: 'stages',
      endpoint: endpoints['stages']!,
      methodConnectors: {
        'check': _i1.MethodConnector(
          name: 'check',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'jobId': _i1.ParameterDescription(
              name: 'jobId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'stage': _i1.ParameterDescription(
              name: 'stage',
              type: _i1.getType<_i6.Stage>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stages'] as _i3.StagesEndpoint).check(
            session,
            params['teamId'],
            params['jobId'],
            params['stage'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'jobId': _i1.ParameterDescription(
              name: 'jobId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stages'] as _i3.StagesEndpoint).create(
            session,
            params['teamId'],
            params['jobId'],
            params['name'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'jobId': _i1.ParameterDescription(
              name: 'jobId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stages'] as _i3.StagesEndpoint).delete(
            session,
            params['teamId'],
            params['jobId'],
            params['id'],
          ),
        ),
        'readStages': _i1.MethodConnector(
          name: 'readStages',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'jobId': _i1.ParameterDescription(
              name: 'jobId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stages'] as _i3.StagesEndpoint).readStages(
            session,
            params['teamId'],
            params['jobId'],
          ),
        ),
      },
    );
    connectors['teams'] = _i1.EndpointConnector(
      name: 'teams',
      endpoint: endpoints['teams']!,
      methodConnectors: {
        'addUser': _i1.MethodConnector(
          name: 'addUser',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).addUser(
            session,
            params['id'],
            params['userId'],
          ),
        ),
        'checkPerms': _i1.MethodConnector(
          name: 'checkPerms',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userRoleEnum': _i1.ParameterDescription(
              name: 'userRoleEnum',
              type: _i1.getType<_i7.UserRoleEnum>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).checkPerms(
            session,
            params['id'],
            params['userRoleEnum'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).create(
            session,
            params['name'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).delete(
            session,
            params['id'],
          ),
        ),
        'getCRUDUsers': _i1.MethodConnector(
          name: 'getCRUDUsers',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).getCRUDUsers(
            session,
            params['id'],
          ),
        ),
        'getTheUserList': _i1.MethodConnector(
          name: 'getTheUserList',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).getTheUserList(
            session,
            params['id'],
          ),
        ),
        'read': _i1.MethodConnector(
          name: 'read',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).read(
            session,
            params['id'],
          ),
        ),
        'readList': _i1.MethodConnector(
          name: 'readList',
          params: {
            'seach': _i1.ParameterDescription(
              name: 'seach',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).readList(
            session,
            params['seach'],
          ),
        ),
        'readNameOnly': _i1.MethodConnector(
          name: 'readNameOnly',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teams'] as _i4.TeamsEndpoint).readNameOnly(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['userInfo'] = _i1.EndpointConnector(
      name: 'userInfo',
      endpoint: endpoints['userInfo']!,
      methodConnectors: {
        'checkIfEmailIsFree': _i1.MethodConnector(
          name: 'checkIfEmailIsFree',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userInfo'] as _i5.UserInfoEndpoint)
                  .checkIfEmailIsFree(
            session,
            params['email'],
          ),
        ),
        'getUsername': _i1.MethodConnector(
          name: 'getUsername',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userInfo'] as _i5.UserInfoEndpoint)
                  .getUsername(session),
        ),
        'getUserSettings': _i1.MethodConnector(
          name: 'getUserSettings',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userInfo'] as _i5.UserInfoEndpoint)
                  .getUserSettings(session),
        ),
        'searchByName': _i1.MethodConnector(
          name: 'searchByName',
          params: {
            'key': _i1.ParameterDescription(
              name: 'key',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userInfo'] as _i5.UserInfoEndpoint).searchByName(
            session,
            params['key'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}

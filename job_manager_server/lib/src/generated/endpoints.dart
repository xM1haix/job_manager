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
import '../endpoints/job_endpoint.dart' as _i2;
import '../endpoints/teams_endpoints.dart' as _i3;
import '../endpoints/user_data_endpoints.dart' as _i4;
import '../endpoints/user_endpoints.dart' as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'job': _i2.JobEndpoint()
        ..initialize(
          server,
          'job',
          null,
        ),
      'teamsEndpoints': _i3.TeamsEndpoints()
        ..initialize(
          server,
          'teamsEndpoints',
          null,
        ),
      'userInfo': _i4.UserInfoEndpoint()
        ..initialize(
          server,
          'userInfo',
          null,
        ),
      'userEndpoints': _i5.UserEndpoints()
        ..initialize(
          server,
          'userEndpoints',
          null,
        ),
    };
    connectors['job'] = _i1.EndpointConnector(
      name: 'job',
      endpoint: endpoints['job']!,
      methodConnectors: {
        'readJobs': _i1.MethodConnector(
          name: 'readJobs',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['job'] as _i2.JobEndpoint).readJobs(
            session,
            params['teamId'],
          ),
        )
      },
    );
    connectors['teamsEndpoints'] = _i1.EndpointConnector(
      name: 'teamsEndpoints',
      endpoint: endpoints['teamsEndpoints']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isPrivate': _i1.ParameterDescription(
              name: 'isPrivate',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teamsEndpoints'] as _i3.TeamsEndpoints).create(
            session,
            params['name'],
            params['isPrivate'],
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
              (endpoints['teamsEndpoints'] as _i3.TeamsEndpoints).delete(
            session,
            params['id'],
          ),
        ),
        'hide': _i1.MethodConnector(
          name: 'hide',
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
              (endpoints['teamsEndpoints'] as _i3.TeamsEndpoints).hide(
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
              (endpoints['teamsEndpoints'] as _i3.TeamsEndpoints).read(
            session,
            params['id'],
          ),
        ),
        'readList': _i1.MethodConnector(
          name: 'readList',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teamsEndpoints'] as _i3.TeamsEndpoints)
                  .readList(session),
        ),
        'simpleRead': _i1.MethodConnector(
          name: 'simpleRead',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['teamsEndpoints'] as _i3.TeamsEndpoints)
                  .simpleRead(session),
        ),
        'userList': _i1.MethodConnector(
          name: 'userList',
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
              (endpoints['teamsEndpoints'] as _i3.TeamsEndpoints).userList(
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
        'getUsername': _i1.MethodConnector(
          name: 'getUsername',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userInfo'] as _i4.UserInfoEndpoint)
                  .getUsername(session),
        )
      },
    );
    connectors['userEndpoints'] = _i1.EndpointConnector(
      name: 'userEndpoints',
      endpoint: endpoints['userEndpoints']!,
      methodConnectors: {
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
              (endpoints['userEndpoints'] as _i5.UserEndpoints).searchByName(
            session,
            params['key'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}

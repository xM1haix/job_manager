import 'package:job_manager_server/all.dart';
import 'package:job_manager_server/tools/error.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserInfoEndpoint extends Endpoint {
  Future<String> getUsername(Session session) async {
    final authenticationInfo = await getCurrentUser(session);
    final userInfo =
        await UserInfo.db.findById(session, authenticationInfo.userId);
    if (userInfo == null) throwErr("No userInfo");
    return userInfo.fullName ?? userInfo.userName ?? userInfo.email ?? '';
  }
}

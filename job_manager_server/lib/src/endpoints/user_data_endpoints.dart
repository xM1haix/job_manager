import 'package:job_manager_server/error.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserInfoEndpoint extends Endpoint {
  Future<String> getUsername(Session session) async {
    final currentUser = await session.authenticated;
    if (currentUser == null) throwErr("User not sign in!");
    final userExtension =
        await UserInfo.db.findById(session, currentUser.userId);
    if (userExtension == null) throwErr("No userExtension");
    return userExtension.fullName ??
        userExtension.userName ??
        userExtension.email ??
        '';
  }
}

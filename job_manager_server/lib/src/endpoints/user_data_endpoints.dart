import 'package:job_manager_server/all.dart';
import 'package:job_manager_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserInfoEndpoint extends Endpoint {
  Future<String> checkIfEmailIsFree(Session session, String email) async {
    final userInfo = await getUserInfo(session);
    if (email == userInfo.email) {
      throw CustomException(message: "Same email was set");
    }
    final founded = await UserInfo.db.findFirstRow(
      session,
      where: (userInfo) => userInfo.email.equals(email),
    );
    if (founded != null) {
      throw CustomException(message: "Email is not available!");
    }
    return email;
  }

  Future<String> getUsername(Session session) async {
    final userInfo = await getUserInfo(session);
    return userInfo.fullName ?? userInfo.userName ?? userInfo.email ?? '';
  }

  Future<UserSettings> getUserSettings(Session session) async {
    final userInfo = await getUserInfo(session);
    final email = userInfo.email;
    final username = userInfo.fullName;
    return UserSettings(email: email, username: username);
  }

  Future<List<UserInfo>> searchByName(Session session, String key) async {
    await getCurrentUser(session);
    return UserInfo.db
        .find(session, where: (user) => user.userName.ilike("%$key%"));
  }
}

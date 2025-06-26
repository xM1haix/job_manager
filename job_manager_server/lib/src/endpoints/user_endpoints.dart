import 'package:job_manager_server/all.dart';
import 'package:job_manager_server/src/generated/custom_exception.ymal.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';

class UserEndpoints extends Endpoint {
  Future<List<UserInfo>> searchByName(Session session, String key) async {
    await getCurrentUser(session);
    return UserInfo.db
        .find(session, where: (user) => user.userName.ilike("%$key%"));
  }

  Future<String> setNewEmail(Session session, String email) async {
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
}

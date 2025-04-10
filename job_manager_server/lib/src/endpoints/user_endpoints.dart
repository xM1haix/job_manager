import 'package:job_manager_server/all.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';

class UserEndpoints extends Endpoint {
  Future<List<UserInfo>> searchByName(Session session, String key) async {
    await getCurrentUser(session);
    return UserInfo.db
        .find(session, where: (user) => user.userName.ilike("%$key%"));
  }
}

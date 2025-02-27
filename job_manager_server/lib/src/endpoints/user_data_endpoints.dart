import 'package:job_manager_server/error.dart';
import 'package:job_manager_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserData extends Endpoint {
  Future<String> getUsername(Session session) async {
    final currentUser = await session.authenticated;
    if (currentUser == null) throwErr("User not sign in!");
    final userExtension = await User.db.findById(session, currentUser.userId);
    if (userExtension == null) throwErr("No userExtension");
    return userExtension.name;
  }
}

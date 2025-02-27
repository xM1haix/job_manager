import 'package:job_manager_server/error.dart';
import 'package:serverpod/serverpod.dart';

Future<AuthenticationInfo> getCurrentUser(Session session) async {
  final currentUser = await session.authenticated;
  if (currentUser == null) throwErr("User not sign in!");
  return currentUser;
}

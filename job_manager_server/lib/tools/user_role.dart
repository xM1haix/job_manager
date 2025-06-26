import 'package:job_manager_server/src/generated/protocol.dart';
import 'package:job_manager_server/tools/error.dart';
import 'package:serverpod/serverpod.dart';

UserRole getOwnerUserRole(int teamId) => UserRole(
      stageProgressUpdate: true,
      stageProgressRevoke: true,
      name: 'OWNER',
      teamId: teamId,
      jobCreate: true,
      jobRead: true,
      jobUpdate: true,
      jobDelete: true,
      stageCreate: true,
      stageRead: true,
      stageUpdate: true,
      stageDelete: true,
      teamUpdate: true,
      teamDelete: true,
      roleCreate: true,
      roleRead: true,
      roleUpdate: true,
      roleDelete: true,
      teamUserCreate: true,
      teamUserDelete: true,
      teamUserRead: true,
      teamUserUpdate: true,
    );
Future<UserRole> getUserRole(Session session, int userId, int teamId) async {
  final teamUser = await TeamUser.db.findFirstRow(
    session,
    where: (tu) => tu.teamId.equals(teamId) & tu.userId.equals(userId),
  );
  if (teamUser == null) throwErr("Combo userId and teamId doesn't exist");
  final x = await UserRole.db.findById(
    session,
    teamUser.roleId,
  );
  if (x == null) throwErr("UserRole doesn't exist");
  return x;
}

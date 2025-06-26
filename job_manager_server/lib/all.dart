import 'package:job_manager_server/src/generated/protocol.dart';
import 'package:job_manager_server/tools/error.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

Future<Team> existTeam(Session session, int id) async {
  final team = await Team.db.findById(session, id);
  if (team == null) throwErr("Cannot find the team");
  return team;
}

Future<AuthenticationInfo> getCurrentUser(Session session) async {
  final user = await session.authenticated;
  if (user == null) throwErr("User not sign in!");
  return user;
}

Future<UserInfo> getUserInfo(Session session) async {
  final userInfo = await UserInfo.db
      .findById(session, (await getCurrentUser(session)).userId);
  if (userInfo == null) throwErr("No userInfo");
  return userInfo;
}

Future<TeamUserData> isInTeam(Session session, int id) async {
  final userId = (await getCurrentUser(session)).userId;
  final x = await existTeam(session, id);
  final user = await TeamUser.db.findFirstRow(
    session,
    where: (teamUser) =>
        teamUser.teamId.equals(id) & teamUser.userId.equals(userId),
  );
  if (user == null) throwErr("You are not included in this team");
  final userRole = await UserRole.db.findById(session, user.roleId);
  if (userRole == null) throwErr("No UserRole found");
  return TeamUserData(x, userId, userRole);
}

Future<void> jobIsInTeam(Session session, int teamId, int jobId) async {
  await existTeam(session, teamId);
  final job = await Job.db.findFirstRow(
    session,
    where: (job) => job.teamId.equals(teamId) & job.id.equals(jobId),
  );
  if (job == null) throwErr("Job is not included in this team!");
}

class TeamUserData {
  final Team team;
  final int userId;
  final UserRole userRole;

  TeamUserData(this.team, this.userId, this.userRole);
}

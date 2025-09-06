import "package:job_manager_server/all.dart";
import "package:job_manager_server/src/generated/protocol.dart";
import "package:job_manager_server/tools/error.dart";
import "package:job_manager_server/tools/user_role.dart";
import "package:serverpod/serverpod.dart";

class TeamsEndpoint extends Endpoint {
  Future<bool> addUser(Session session, int id, int userId) async {
    final x = await isInTeam(session, id);
    if (!x.userRole.teamUserCreate) {
      throwErr("ACCESS DENIED");
    }
    final userRole = await UserRole.db.insertRow(
      session,
      UserRole(teamId: id, name: "Default"),
    );
    if (userRole.id == null) {
      throwErr("the new user role has no id");
    }
    await TeamUser.db.insertRow(
      session,
      TeamUser(
        teamId: id,
        userId: userId,
        roleId: userRole.id!,
      ),
    );
    return true;
  }

  Future<bool> checkPerms(
    Session session,
    int id,
    UserRoleEnum userRoleEnum,
  ) async {
    final x = (await isInTeam(session, id)).userRole;
    return switch (userRoleEnum) {
      UserRoleEnum.jobCreate => x.jobCreate,
      UserRoleEnum.jobRead => x.jobRead,
      UserRoleEnum.jobUpdate => x.jobUpdate,
      UserRoleEnum.jobDelete => x.jobDelete,
      UserRoleEnum.stageCreate => x.stageCreate,
      UserRoleEnum.stageRead => x.stageRead,
      UserRoleEnum.stageUpdate => x.stageUpdate,
      UserRoleEnum.stageDelete => x.stageDelete,
      UserRoleEnum.teamUpdate => x.teamUpdate,
      UserRoleEnum.teamDelete => x.teamDelete,
      UserRoleEnum.roleCreate => x.roleCreate,
      UserRoleEnum.roleRead => x.roleRead,
      UserRoleEnum.roleUpdate => x.roleUpdate,
      UserRoleEnum.roleDelete => x.roleDelete,
      UserRoleEnum.teamUserCreate => x.teamUserCreate,
      UserRoleEnum.teamUserRead => x.teamUserRead,
      UserRoleEnum.teamUserUpdate => x.teamUserUpdate,
      UserRoleEnum.teamUserDelete => x.teamUserDelete,
    };
  }

  Future<bool> create(Session session, String name) async {
    final userId = (await getCurrentUser(session)).userId;
    final createdTeam = await Team.db.insertRow(
      session,
      Team(name: name),
    );
    if (createdTeam.id == null) {
      throwErr("Something wrong while creating team: Team id is null");
    }
    final userRoleOwner = await UserRole.db.insertRow(
      session,
      getOwnerUserRole(createdTeam.id!),
    );

    if (userRoleOwner.id == null) {
      throwErr("the owner user role has no id");
    }
    final newTeamUser = await TeamUser.db.insertRow(
      session,
      TeamUser(
        teamId: createdTeam.id!,
        userId: userId,
        roleId: userRoleOwner.id!,
      ),
    );
    if (newTeamUser.id == null) {
      throwErr("Something wrong while creating TeamUser: TeamUser id is null");
    }
    return true;
  }

  Future<bool> delete(Session session, int id) async {
    final x = await isInTeam(session, id);
    if (!x.userRole.teamDelete) {
      throwErr("ACCESS DENIED");
    }
    await TeamUser.db.deleteWhere(
      session,
      where: (teamUser) => teamUser.teamId.equals(id),
    );
    final currentTeam = await existTeam(session, id);
    await Team.db.deleteRow(session, currentTeam);
    return true;
  }

  Future<CRUDUsersPermission> getCRUDUsers(Session session, int id) async {
    final x = (await isInTeam(session, id)).userRole;
    return CRUDUsersPermission(
      teamUserCreate: x.teamUserCreate,
      teamUserRead: x.teamUserRead,
      teamUserUpdate: x.teamUserUpdate,
      teamUserDelete: x.teamUserDelete,
    );
  }

  Future<List<int>> getTheUserList(Session session, int id) async {
    final x = await isInTeam(session, id);
    if (!x.userRole.teamUserRead) {
      throw CustomException(
        message: "You do not have permission to read the user list",
      );
    }
    final teamUsers = await TeamUser.db
        .find(session, where: (teamUser) => teamUser.teamId.equals(x.team.id));
    return teamUsers.map((e) => e.userId).toList();
  }

  Future<Team> read(Session session, int id) async {
    final team = await existTeam(session, id);
    await isInTeam(session, id);
    return team;
  }

  Future<List<Team>> readList(Session session, String? seach) async {
    final user = await getCurrentUser(session);
    final teamUsers = await TeamUser.db.find(
      session,
      where: (tu) => tu.userId.equals(user.userId),
    );

    return Team.db.find(
      session,
      where: (team) =>
          team.id.inSet(teamUsers.map((e) => e.teamId).toSet()) &
          team.name.ilike("%$seach%"),
    );
  }

  Future<String> readNameOnly(Session session, int id) async {
    await isInTeam(session, id);
    final team = await Team.db.findById(session, id);
    if (team == null) {
      throwErr("Invalid team");
    }
    return team.name;
  }
}

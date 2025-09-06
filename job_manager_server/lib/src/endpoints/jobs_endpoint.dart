import "package:job_manager_server/all.dart";
import "package:job_manager_server/src/generated/protocol.dart";
import "package:job_manager_server/tools/error.dart";
import "package:serverpod/serverpod.dart";

class JobsEndpoint extends Endpoint {
  Future<bool> create(Session session, int teamId, String name) async {
    final x = await isInTeam(session, teamId);
    if (!x.userRole.jobCreate) {
      throwErr("You don't have perms to create jobs!");
    }
    await Job.db.insertRow(session, Job(name: name, teamId: teamId));
    return true;
  }

  Future<List<Job>> readJobs(Session session, int teamId) async {
    final x = await isInTeam(session, teamId);
    if (!x.userRole.jobRead) {
      throwErr("You don't have perms to read jobs!");
    }
    return Job.db.find(session, where: (job) => job.teamId.equals(teamId));
  }

  Future<String> readNameOnly(Session session, int teamId, int id) async {
    final x = await isInTeam(session, teamId);
    if (!x.userRole.jobRead) {
      throwErr("You don't have perms to read jobs!");
    }
    final j = await Job.db.findFirstRow(
      session,
      where: (job) => job.id.equals(id) & job.teamId.equals(teamId),
    );
    if (j == null) {
      throwErr("Invalid combination job_id-team_id!");
    }
    return j.name;
  }
}

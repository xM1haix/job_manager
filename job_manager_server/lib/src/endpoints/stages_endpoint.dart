import 'package:job_manager_server/all.dart';
import 'package:job_manager_server/src/generated/protocol.dart';
import 'package:job_manager_server/tools/error.dart';
import 'package:serverpod/serverpod.dart';

class StagesEndpoint extends Endpoint {
  Future<bool> check(
      Session session, int teamId, int jobId, Stage stage) async {
    final x = (await isInTeam(session, teamId)).userRole;
    if (!x.stageProgressUpdate) {
      throwErr("You don't have perms to update stages!");
    }
    final newStage = stage.copyWith(status: !stage.status);
    final updated = await Stage.db.updateRow(session, newStage);
    return updated.status;
  }

  Future<bool> create(
      Session session, int teamId, int jobId, String name) async {
    final x = await isInTeam(session, teamId);
    if (!x.userRole.stageCreate) {
      throwErr("You don't have perms to create stages!");
    }
    await jobIsInTeam(session, teamId, jobId);
    await Stage.db.insertRow(session, Stage(name: name, jobId: jobId));
    return true;
  }

  Future<bool> delete(Session session, int teamId, int jobId, int id) async {
    final x = (await isInTeam(session, teamId)).userRole;
    if (!x.stageDelete) throwErr("You don't have perms to delete stages!");
    await Stage.db.deleteWhere(session, where: (s) => s.id.equals(id));
    return true;
  }

  Future<StageView> readStages(Session session, int teamId, int jobId) async {
    final x = (await isInTeam(session, teamId)).userRole;
    if (!x.stageRead) throwErr("You don't have perms to read stages!");
    final perms = StagePerms(
      update: x.stageUpdate,
      delete: x.stageDelete,
      progress: x.stageProgressUpdate,
    );
    await jobIsInTeam(session, teamId, jobId);
    final stages = await Stage.db.find(
      session,
      where: (stage) => stage.jobId.equals(jobId),
    );
    return StageView(stages: stages, perms: perms);
  }
}

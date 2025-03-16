import 'package:job_manager_server/get_current_user.dart';
import 'package:job_manager_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class JobEndpoint extends Endpoint {
  Future<List<Job>> readJobs(Session session, int? teamId) async {
    await getCurrentUser(session);
    return await Job.db
        .find(session, where: (job) => job.teamId.equals(teamId));
  }
}

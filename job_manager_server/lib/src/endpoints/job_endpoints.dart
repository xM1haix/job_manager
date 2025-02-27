import 'package:job_manager_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class JobEndpoints extends Endpoint {
  Future<List<Job>> readJobs(Session session) async {
    return [];
  }
}

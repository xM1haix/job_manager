import 'package:job_manager_server/src/generated/protocol.dart';

Never throwErr(x) {
  print(x);
  throw CustomException(message: x);
}

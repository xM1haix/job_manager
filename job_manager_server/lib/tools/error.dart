import 'package:job_manager_server/src/generated/protocol.dart';

void report(x) {
  print(x);
}

Never throwErr(x, [explication]) {
  report({"error": x, "details": explication});
  throw CustomException(message: x);
}

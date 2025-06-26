import 'package:job_manager_server/src/generated/protocol.dart';

void report(dynamic x) {
  print(x);
}

Never throwErr(dynamic x, [dynamic explication]) {
  report({"error": x, "details": explication});
  throw CustomException(message: x);
}

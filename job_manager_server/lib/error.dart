import 'package:job_manager_server/src/generated/protocol.dart';

Never throwErr(x, [explication]) {
  print({"error": x, "details": explication});
  throw CustomException(message: x);
}

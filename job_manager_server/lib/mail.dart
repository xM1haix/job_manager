import "package:job_manager_server/tools/error.dart";
import "package:mailer/mailer.dart";
import "package:mailer/smtp_server/gmail.dart";
import "package:serverpod/serverpod.dart";

Future<SendReport> sendMail(
  Session session,
  String recipient,
  String subject,
  String body,
) async {
  final email = session.serverpod.getPassword("gmailEmail");
  final pass = session.serverpod.getPassword("gmailPassword");
  if (email == null || pass == null) {
    throwErr("Internal error!", "No credentials for mail box");
  }
  return send(
    Message()
      ..from = Address(email)
      ..recipients.add(Address(recipient))
      ..subject = subject
      ..text = body,
    gmail(email, pass),
  );
}

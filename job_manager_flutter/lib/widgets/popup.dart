import "dart:async";

import "package:flutter/material.dart";
import "package:job_manager_client/job_manager_client.dart";
import "package:job_manager_flutter/widgets/nav.dart";

Future<bool> confirmPopup(BuildContext context, String question) async {
  final x = await showDialog<bool?>(
    context: context,
    builder: (context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      title: Text(
        question,
        textAlign: TextAlign.center,
      ),
      actions: [
        PopupAction("Yes!", true),
        PopupAction("No!", false),
      ].map((e) => e.toWidget(context)).toList(),
    ),
  );
  return x ?? false;
}

Future<void> createSmallForum({
  required BuildContext context,
  required Future<bool> Function(String) api,
  required String type,
}) async {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String? errorText = "Name required";
  focusNode.requestFocus();
  final confirm = await popup(
    context,
    "Create $type",
    actions: [
      PopupAction("Cancel!", false),
      PopupAction("Create!", true),
    ],
    content: StatefulBuilder(
      builder: (context, setState) => TextField(
        onChanged: (s) {
          setState(() {
            errorText = s.isEmpty ? "Name required" : null;
          });
        },
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          hintText: "Insert name",
        ),
      ),
    ),
  );
  if (confirm != true) {
    return;
  }
  if (!context.mounted) {
    return;
  }
  loadingpopup(context);
  final tn = controller.text;
  try {
    final create = await api(controller.text);
    if (!context.mounted) {
      return;
    }
    if (!create) {
      throw Exception("Unknown error");
    }
    back(context);
    unawaited(infoPopup(context, "$type `$tn` created succesfully!"));
  } on CustomException catch (e) {
    back(context);
    unawaited(errorPopup(context, "Error while creating $type `$tn`!\n$e"));
  } catch (e) {
    unawaited(errorPopup(context, e));
  }
}

Future<void> errorPopup(BuildContext context, e) async => showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Something went wrong"),
        content: Text(e.toString()),
        actionsAlignment: MainAxisAlignment.center,
        actions: [PopupAction("Ok!").toWidget(context)],
      ),
    );
Future<void> infoPopup(BuildContext context, String title) async =>
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        actionsAlignment: MainAxisAlignment.center,
        actions: [PopupAction("Ok!").toWidget(context)],
      ),
    );
void loadingpopup(BuildContext context) => popup(
      context,
      "Loading",
      content: const CircularProgressIndicator(),
    );

Future<T?> popup<T>(
  BuildContext context,
  String title, {
  List<PopupAction<T>> actions = const [],
  Widget? content,
}) async =>
    showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: actions.map((e) => e.toWidget(context)).toList(),
      ),
    );

class PopupAction<T> {
  PopupAction(this.text, [this.value]);
  final String text;
  final T? value;
  Widget toWidget(BuildContext context) => TextButton(
        onPressed: () => back(context, value),
        child: Text(text),
      );
}

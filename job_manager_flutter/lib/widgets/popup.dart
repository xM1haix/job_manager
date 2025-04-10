import 'package:flutter/material.dart';
import 'package:job_manager_client/job_manager_client.dart';

import 'nav.dart';

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
        PopupAction('Yes!', true),
        PopupAction('No!', false),
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
  if (confirm != true) return;
  if (!context.mounted) return;
  loadingpopup(context);
  final tn = controller.text;
  try {
    final create = await api(controller.text);
    if (!context.mounted) return;
    if (!create) throw "Unknown error";
    back(context);
    infoPopup(context, "$type `$tn` created succesfully!");
  } on CustomException catch (e) {
    back(context);
    errorPopup(context, "Error while creating $type `$tn`!\n$e");
  } catch (e) {
    errorPopup(context, e);
  }
}

Future<void> errorPopup(BuildContext context, dynamic e) async =>
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Something went wrong"),
        content: Text(e.toString()),
        actionsAlignment: MainAxisAlignment.center,
        actions: [PopupAction('Ok!').toWidget(context)],
      ),
    );
Future<void> infoPopup(BuildContext context, String title) async =>
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        actionsAlignment: MainAxisAlignment.center,
        actions: [PopupAction('Ok!').toWidget(context)],
      ),
    );
void loadingpopup(BuildContext context) => popup(
      context,
      'Loading',
      content: CircularProgressIndicator(),
    );

Future<T?> popup<T>(BuildContext context, String title,
        {List<PopupAction<T>> actions = const [], Widget? content}) async =>
    await showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: actions.map((e) => e.toWidget(context)).toList(),
      ),
    );

class PopupAction<T> {
  final String text;
  final T? value;
  PopupAction(this.text, [this.value]);
  Widget toWidget(BuildContext context) => TextButton(
        onPressed: () => back(context, value),
        child: Text(text),
      );
}

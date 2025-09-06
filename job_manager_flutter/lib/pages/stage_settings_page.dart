import "package:flutter/material.dart";

class StageSettingsPage extends StatefulWidget {
  const StageSettingsPage(
    this.id, {
    super.key,
  });
  final int id;

  @override
  State<StageSettingsPage> createState() => _StageSettingsPageState();
}

class _StageSettingsPageState extends State<StageSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stage ${widget.id} settings"),
      ),
    );
  }
}

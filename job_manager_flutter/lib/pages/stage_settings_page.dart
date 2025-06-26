import 'package:flutter/material.dart';

class StageSettingsPage extends StatefulWidget {
  final int id;
  const StageSettingsPage(
    this.id, {
    super.key,
  });

  @override
  State<StageSettingsPage> createState() => _StageSettingsPageState();
}

class _StageSettingsPageState extends State<StageSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job ${widget.id} settings"),
      ),
    );
  }
}

import "package:flutter/material.dart";

class JobSettingsPage extends StatefulWidget {
  const JobSettingsPage(
    this.id, {
    super.key,
  });
  final int id;

  @override
  State<JobSettingsPage> createState() => _JobSettingsPageState();
}

class _JobSettingsPageState extends State<JobSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team_${widget.id}_settings_page"),
      ),
    );
  }
}

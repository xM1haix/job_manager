import 'package:flutter/material.dart';

class CreateJob extends StatefulWidget {
  final int? teamId;
  const CreateJob(this.teamId, {super.key});

  @override
  State<CreateJob> createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create task"),
      ),
      body: Text("NOT IMPLEMENTED"),
    );
  }
}

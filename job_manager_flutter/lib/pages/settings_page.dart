import 'package:flutter/material.dart';
import 'package:job_manager_flutter/widgets/future_builder.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final _future = _getString();
  final _email = TextEditingController();
  bool _editEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(
            tooltip: "Report a bug",
            icon: Icon(Icons.bug_report_outlined),
            onPressed: _reportBug,
          ),
          IconButton(
            tooltip: "Changelog",
            icon: Icon(Icons.info_outline),
            onPressed: _showChangelog,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            CustomFutureBuilder(
              future: _future,
              success: (x) {
                _email.text = x;
                return TextField(
                  readOnly: _editEmail,
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    suffix: IconButton(
                      onPressed: _onEmailSuffix,
                      icon: Icon(Icons.edit),
                    ),
                  ),
                );
              },
            ),
            TextField(),
            TextButton(
              onPressed: _changePassword,
              child: Text("Change password!"),
            ),
            TextButton(
              onPressed: _logout,
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _changePassword() async {}
  Future<String> _getString() async => 'this is your email';

  Future<void> _logout() async {}
  Future<void> _onEmailSuffix() async {
    if (!_editEmail) {
      setState(() {
        _editEmail = true;
      });
      return;
    }
    //TODO SAVE THE EMAIL
  }

  Future<void> _onRefresh() async {}
  Future<void> _reportBug() async {}
  void _showChangelog() {}
}

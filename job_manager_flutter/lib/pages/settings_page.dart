import "package:flutter/material.dart";
import "package:job_manager_client/job_manager_client.dart";
import "package:job_manager_flutter/main.dart";
import "package:job_manager_flutter/widgets/custom_input.dart";
import "package:job_manager_flutter/widgets/del_btn.dart";
import "package:job_manager_flutter/widgets/future_builder.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Future<UserSettings> _future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          IconButton(
            tooltip: "Report a bug",
            icon: const Icon(Icons.bug_report_outlined),
            onPressed: _reportBug,
          ),
          IconButton(
            tooltip: "Changelog",
            icon: const Icon(Icons.info_outline),
            onPressed: _showChangelog,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomFutureBuilder(
          future: _future,
          success: (x) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                CustomInput(
                  label: "email",
                  initValue: x.email,
                  onUpdate: _setEmail,
                  onCheck: _checkEmail,
                ),
                const SizedBox(height: 20),
                CustomInput(
                  label: "username",
                  initValue: x.username,
                  onUpdate: _setUsername,
                  onCheck: _checkUsername,
                ),
                TextButton(
                  onPressed: _changePassword,
                  child: const Text("Change password!"),
                ),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      icon: const Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                        size: 30,
                      ),
                      onPressed: _logout,
                      label: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const DelIcon(size: 30),
                      label: const Text(
                        "Delete account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _changePassword() async {}

  Future<void> _checkEmail(String email) async {}
  Future<void> _checkUsername(String email) async {}
  Future<UserSettings> _getUserInfo() async =>
      client.userInfo.getUserSettings();
  void _init() {
    setState(() {
      _future = _getUserInfo();
    });
  }

  Future<void> _logout() async {}

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    _init();
  }

  Future<void> _reportBug() async {}

  Future<void> _setEmail(String email) async {}

  Future<void> _setUsername(String email) async {}
  void _showChangelog() {}
}

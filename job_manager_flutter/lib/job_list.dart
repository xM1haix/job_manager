import 'package:flutter/material.dart';
import 'package:job_manager_client/job_manager_client.dart';
import 'package:job_manager_flutter/connect/connect.dart';
import 'package:job_manager_flutter/create_job.dart';
import 'package:job_manager_flutter/fab_add.dart';
import 'package:job_manager_flutter/future_builder.dart';
import 'package:job_manager_flutter/main.dart';
import 'package:job_manager_flutter/nav.dart';
import 'package:job_manager_flutter/popup.dart';
import 'package:job_manager_flutter/settings.dart';
import 'package:job_manager_flutter/steps_list.dart';
import 'package:job_manager_flutter/teams.dart';

class JobList extends StatefulWidget {
  const JobList({super.key});

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  late Future<List<SimpleTeam>> _getTeams;
  late Future<String> _getUsername;
  late Future<List<Job>> _getJobs;
  SimpleTeam? _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_selected?.name ?? "All your"} jobs"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.white],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: CustomFutureBuilder(
                future: _getUsername,
                success: (username) => Text(
                  username,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomFutureBuilder(
                future: _getTeams,
                success: (teams) => teams.isEmpty
                    ? Center(
                        child: Text("You have no teams"),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: teams.length,
                        itemBuilder: (context, i) {
                          final selected = i == _selected;
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: Tooltip(
                              message: teams[i].name,
                              child: InkWell(
                                splashColor:
                                    selected ? Colors.black : Colors.green,
                                onTap: () => _changeTeam(teams[i]),
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  margin: const EdgeInsets.all(3),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: selected
                                        ? Colors.green.withAlpha(0xAA)
                                        : Color(0xAA121212),
                                  ),
                                  child: Text(
                                    teams[i].name,
                                    style: TextStyle(
                                      color: selected
                                          ? Colors.white
                                          : Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  tooltip: "Settings",
                  icon: Icon(
                    Icons.settings,
                  ),
                  onPressed: _goToSettings,
                ),
                IconButton(
                  tooltip: "Manage Teams",
                  icon: Icon(
                    Icons.groups_outlined,
                  ),
                  onPressed: _manageTeams,
                ),
                IconButton(
                  tooltip: "Logout",
                  icon: Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  onPressed: _logout,
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FabAdd(
        tooltip: "Create new work",
        onPressed: _createNewJob,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomFutureBuilder(
          future: _getJobs,
          success: (x) => ListView.builder(
            itemCount: x.length,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(5),
              child: Tooltip(
                message: "Work $i",
                child: InkWell(
                  hoverColor: Color(0xFFC0C0C0),
                  splashColor: Colors.green,
                  onTap: () => _openWork(i),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xAA121212),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Work $i",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "$i% DONE",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        AnimatedSwitcher(
                          duration: Duration(seconds: 1),
                          child: _selected == null
                              ? SizedBox(height: 20)
                              : Text(
                                  "Team $i",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(10),
                          value: i * 1 / 10,
                          minHeight: 5,
                          backgroundColor: Colors.black,
                          color: Colors.green.withAlpha((0xFF * i / 10).ceil()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _changeTeam(SimpleTeam i) {
    setState(() {
      _selected = _selected == i ? null : i;
    });
  }

  void _createNewJob() => nav(context, CreateJob(_selected?.id));

  void _goToSettings() => nav(context, Settings());
  void _init() {
    setState(() {
      _getTeams = client.teamsEndpoints.simpleRead();
      _getUsername = client.userInfo.getUsername();
      _getJobs = client.job.readJobs(_selected?.id);
    });
  }

  Future<void> _logout() async {
    if (!(await confirmPopup(
      context,
      "Are you sure you want to signout?",
    ))) {
      return;
    }
    try {
      final x = await sessionManager.signOutDevice();
      if (!mounted && !x) return;
      nav(context, const Connect(), true);
    } catch (e) {
      if (!mounted) return;
      errorPopup(context, e);
    }
  }

  Future<void> _manageTeams() async {
    await nav(context, Teams());
    setState(() {
      _getTeams = client.teamsEndpoints.simpleRead();
    });
  }

  Future<void> _onRefresh() async {
    setState(() {
      _getJobs = client.job.readJobs(_selected?.id);
    });
  }

  void _openWork(int i) => nav(context, StepsList(i));
}

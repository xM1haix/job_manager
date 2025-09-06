import "package:flutter/material.dart";
import "package:job_manager_client/job_manager_client.dart";
import "package:job_manager_flutter/main.dart";
import "package:job_manager_flutter/pages/job_settigns_page.dart";
import "package:job_manager_flutter/pages/stages_list_page.dart";
import "package:job_manager_flutter/pages/team_user_page.dart";
import "package:job_manager_flutter/widgets/fab_add.dart";
import "package:job_manager_flutter/widgets/future_builder.dart";
import "package:job_manager_flutter/widgets/future_list_view_builder.dart";
import "package:job_manager_flutter/widgets/nav.dart";
import "package:job_manager_flutter/widgets/popup.dart";

class JobsListPage extends StatefulWidget {
  const JobsListPage(this.id, {super.key});
  final int id;

  @override
  State<JobsListPage> createState() => _JobsListPageState();
}

class _JobsListPageState extends State<JobsListPage> {
  late Future<bool> _futurePermissionAdd;
  late Future<String> _getName;
  late Future<List<Job>> _getJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomFutureBuilder(
          future: _getName,
          success: (x) => Text("Team $x - Jobs"),
        ),
        actions: [
          IconButton(
            onPressed: _goToTeamUsers,
            icon: const Icon(Icons.people),
          ),
          IconButton(
            onPressed: _goToSettings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: CustomFutureBuilder(
        future: _futurePermissionAdd,
        success: (x) => x
            ? FabAdd(
                tooltip: "Create new job",
                onPressed: _createJob,
              )
            : const SizedBox.shrink(),
      ),
      body: FutureListViewBuilder(
        future: _getJobs,
        onRefresh: () async => _readList(),
        type: "jobs",
        element: (e, i) => Padding(
          padding: const EdgeInsets.all(5),
          child: Tooltip(
            message: e.name,
            child: InkWell(
              hoverColor: const Color(0xFFC0C0C0),
              splashColor: Colors.green,
              onTap: () => _navToJob(e.id),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xAA121212),
                ),
                child: Text(
                  e.name,
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

  Future<void> _createJob() async {
    await createSmallForum(
      context: context,
      api: (s) async => client.jobs.create(widget.id, s),
      type: "job",
    );
    _init();
  }

  Future<void> _goToSettings() async {
    await nav(context, JobSettingsPage(widget.id));
  }

  Future<void> _goToTeamUsers() async {
    await nav(context, TeamUsersPage(widget.id));
  }

  void _init() {
    _readList();
    setState(() {
      _futurePermissionAdd =
          client.teams.checkPerms(widget.id, UserRoleEnum.jobCreate);
      _getName = client.teams.readNameOnly(widget.id);
    });
  }

  Future<void> _navToJob(int? id) async {
    if (id == null) {
      return;
    }
    await nav(context, StagesListPage(widget.id, id));
    _init();
  }

  void _readList() {
    setState(() {
      _getJobs = client.jobs.readJobs(widget.id);
    });
  }
}

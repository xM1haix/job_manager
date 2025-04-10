import 'package:flutter/material.dart';
import 'package:job_manager_client/job_manager_client.dart';
import 'package:job_manager_flutter/main.dart';
import 'package:job_manager_flutter/pages/stages_list_page.dart';
import 'package:job_manager_flutter/widgets/fab_add.dart';
import 'package:job_manager_flutter/widgets/future_builder.dart';
import 'package:job_manager_flutter/widgets/future_list_view_builder.dart';
import 'package:job_manager_flutter/widgets/nav.dart';
import 'package:job_manager_flutter/widgets/popup.dart';

class JobsListPage extends StatefulWidget {
  final int id;
  const JobsListPage(this.id, {super.key});

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
          success: (x) => Text(x),
        ),
        actions: [
          IconButton(
            onPressed: _goToSettings,
            icon: Icon(Icons.settings),
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
            : SizedBox.shrink(),
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
              hoverColor: Color(0xFFC0C0C0),
              splashColor: Colors.green,
              onTap: () => _navToJob(e.id),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xAA121212),
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
      api: (s) async => await client.jobs.create(widget.id, s),
      type: 'job',
    );
    _init();
  }

  Future<void> _goToSettings() async {
    // await nav(context, TeamSettings(widget.id));
    //TODO
    //FIX THIS
    await nav(context, Scaffold());
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
    if (id == null) return;
    await nav(context, StagesListPage(widget.id, id));
    _init();
  }

  void _readList() {
    setState(() {
      _getJobs = client.jobs.readJobs(widget.id);
    });
  }
}

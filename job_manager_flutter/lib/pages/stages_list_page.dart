import 'package:flutter/material.dart';
import 'package:job_manager_client/job_manager_client.dart';
import 'package:job_manager_flutter/main.dart';
import 'package:job_manager_flutter/widgets/fab_add.dart';
import 'package:job_manager_flutter/widgets/future_builder.dart';
import 'package:job_manager_flutter/widgets/nav.dart';
import 'package:job_manager_flutter/widgets/popup.dart';
import 'package:job_manager_flutter/widgets/refresh_list_view_builder.dart';

class StagesListPage extends StatefulWidget {
  final int tid, id;
  const StagesListPage(this.tid, this.id, {super.key});

  @override
  State<StagesListPage> createState() => _StagesListPageState();
}

class _StagesListPageState extends State<StagesListPage> {
  late Future<bool> _futurePermissionAdd;
  late Future<String> _getName;
  late Future<StageView> _getStages;

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
                tooltip: "Create new stage",
                onPressed: _createStage,
              )
            : SizedBox.shrink(),
      ),
      body: CustomFutureBuilder(
        future: _getStages,
        success: (x) => RefreshListViewBuilder(
          onRefresh: () async => _readStages(),
          type: "stages",
          list: x.stages,
          builder: (e, i) => e.id == null
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(5),
                  child: Tooltip(
                    message: e.name,
                    child: InkWell(
                      hoverColor: Color(0xFFC0C0C0),
                      splashColor: Colors.green,
                      onTap: () => _check(e),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xAA121212),
                        ),
                        child: Row(
                          children: [
                            AnimatedSwitcher(
                              duration: Duration(seconds: 1),
                              child: Icon(
                                key: Key(e.status.toString()),
                                e.status
                                    ? Icons.check_box_outlined
                                    : Icons.check_box_outline_blank,
                                color: e.status ? Colors.green : Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              e.name,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () => _delete(x.stages, i),
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _edit(e),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                          ],
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

  Future<void> _check(Stage e) async {
    final x = await client.stages.check(widget.tid, widget.id, e);
    setState(() {
      e.status = x;
    });
  }

  Future<void> _createStage() async {
    await createSmallForum(
      context: context,
      api: (s) async => await client.stages.create(widget.tid, widget.id, s),
      type: 'stage',
    );
    _init();
  }

  Future<void> _delete(List<Stage> stages, int i) async {
    final e = stages[i];
    await client.stages.delete(widget.tid, widget.id, e.id!);
    setState(() {
      stages.removeAt(i);
    });
  }

  Future<void> _edit(Stage e) async {}

  Future<void> _goToSettings() async {
    // await nav(context, TeamSettings(widget.id));
    //TODO FIX GO TO SETTINGS
    await nav(context, Scaffold());
  }

  void _init() {
    _readStages();
    setState(() {
      _futurePermissionAdd =
          client.teams.checkPerms(widget.tid, UserRoleEnum.stageCreate);
      _getName = client.jobs.readNameOnly(widget.tid, widget.id);
    });
  }

  void _readStages() {
    setState(() {
      _getStages = client.stages.readStages(widget.tid, widget.id);
    });
  }
}

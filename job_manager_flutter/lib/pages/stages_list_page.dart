import "package:flutter/material.dart";
import "package:job_manager_client/job_manager_client.dart";
import "package:job_manager_flutter/main.dart";
import "package:job_manager_flutter/pages/stage_settings_page.dart";
import "package:job_manager_flutter/widgets/del_btn.dart";
import "package:job_manager_flutter/widgets/fab_add.dart";
import "package:job_manager_flutter/widgets/future_builder.dart";
import "package:job_manager_flutter/widgets/nav.dart";
import "package:job_manager_flutter/widgets/popup.dart";
import "package:job_manager_flutter/widgets/refresh_list_view_builder.dart";

class StagesListPage extends StatefulWidget {
  const StagesListPage(this.tid, this.id, {super.key});
  final int tid;
  final int id;

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
          success: Text.new,
        ),
        actions: [
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
                tooltip: "Create new stage",
                onPressed: _createStage,
              )
            : const SizedBox.shrink(),
      ),
      body: CustomFutureBuilder(
        future: _getStages,
        success: (x) => RefreshListViewBuilder(
          onRefresh: () async => _readStages(),
          type: "stages",
          list: x.stages,
          builder: (e, i) => e.id == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(5),
                  child: Tooltip(
                    message: e.name,
                    child: InkWell(
                      hoverColor: const Color(0xFFC0C0C0),
                      splashColor: Colors.green,
                      onTap: () => _check(e),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xAA121212),
                        ),
                        child: Row(
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              child: Icon(
                                key: Key(e.status.toString()),
                                e.status
                                    ? Icons.check_box_outlined
                                    : Icons.check_box_outline_blank,
                                color: e.status ? Colors.green : Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              e.name,
                            ),
                            const Spacer(),
                            DelBtn(
                              onPressed: () => _delete(x.stages, i),
                            ),
                            IconButton(
                              onPressed: () => _edit(e),
                              icon: const Icon(
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
    try {
      final x = await client.stages.check(widget.tid, widget.id, e);
      if (x != e.status) {
        setState(() {
          e.status = x;
        });
      }
    } on CustomException catch (err) {
      if (!mounted) {
        return;
      }
      await errorPopup(context, err.message);
      return;
    } catch (err) {
      if (!mounted) {
        return;
      }
      await errorPopup(context, err);
      return;
    }
  }

  Future<void> _createStage() async {
    await createSmallForum(
      context: context,
      api: (s) async => client.stages.create(widget.tid, widget.id, s),
      type: "stage",
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
    await nav(context, StageSettingsPage(widget.id));
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

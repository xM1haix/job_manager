import "dart:async";

import "package:flutter/material.dart";
import "package:job_manager_client/job_manager_client.dart";
import "package:job_manager_flutter/main.dart";
import "package:job_manager_flutter/pages/jobs_list_page.dart";
import "package:job_manager_flutter/pages/settings_page.dart";
import "package:job_manager_flutter/widgets/app_bar.dart";
import "package:job_manager_flutter/widgets/fab_add.dart";
import "package:job_manager_flutter/widgets/future_list_view_builder.dart";
import "package:job_manager_flutter/widgets/nav.dart";
import "package:job_manager_flutter/widgets/popup.dart";

class TeamsListPage extends StatefulWidget {
  const TeamsListPage({super.key});

  @override
  State<TeamsListPage> createState() => _TeamsListPageState();
}

class _TeamsListPageState extends State<TeamsListPage> {
  late Future<List<Team>> _future;
  final _seachFocusNode = FocusNode();
  final _searchControlller = TextEditingController();
  var _isSearchOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isSearchOn
          ? null
          : FabAdd(
              tooltip: "Create a new team",
              onPressed: _createTeam,
            ),
      appBar: CustomAppBar(
        switchToSearch: _showSearch,
        isSearchOn: _isSearchOn,
        controller: _searchControlller,
        closeSeach: _closeSeach,
        goToSettings: _goToSettings,
        focusNode: _seachFocusNode,
      ),
      body: FutureListViewBuilder(
        onRefresh: () async => _init(),
        future: _future,
        type: "teams",
        element: (e, i) {
          if (e.id == null) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Tooltip(
              message: e.name,
              child: InkWell(
                hoverColor: const Color(0xFFC0C0C0),
                splashColor: Colors.green,
                onTap: () async => _navToTeam(e.id),
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
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _closeSeach() {
    setState(() {
      _isSearchOn = false;
      _searchControlller.clear();
    });
  }

  Future<void> _createTeam() async {
    await createSmallForum(
      context: context,
      api: (s) async => client.teams.create(s),
      type: "team",
    );
    _init();
  }

  void _goToSettings() {
    unawaited(nav(context, const SettingsPage()));
  }

  void _init() {
    setState(() {
      _future = client.teams.readList(_searchControlller.text);
    });
  }

  Future<void> _navToTeam(int? id) async {
    if (id == null) {
      return;
    }
    await nav(context, JobsListPage(id));
    _init();
  }

  void _showSearch() {
    if (_isSearchOn) {
      _init();
      return;
    }
    setState(() {
      _isSearchOn = true;
      _seachFocusNode.requestFocus();
    });
  }
}

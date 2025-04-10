import 'package:flutter/material.dart';
import 'package:job_manager_client/job_manager_client.dart';
import 'package:job_manager_flutter/main.dart';
import 'package:job_manager_flutter/pages/jobs_list_page.dart';
import 'package:job_manager_flutter/widgets/fab_add.dart';
import 'package:job_manager_flutter/widgets/future_list_view_builder.dart';
import 'package:job_manager_flutter/widgets/nav.dart';
import 'package:job_manager_flutter/widgets/popup.dart';

class TeamsListPage extends StatefulWidget {
  const TeamsListPage({super.key});

  @override
  State<TeamsListPage> createState() => _TeamsListPageState();
}

class _TeamsListPageState extends State<TeamsListPage> {
  late Future<List<Team>> _future;
  final _seachFocusNode = FocusNode();
  final _searchControlller = TextEditingController();
  bool _isSeachOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isSeachOn
          ? null
          : FabAdd(tooltip: "Create a new team", onPressed: _createTeam),
      appBar: AppBar(
        leading: _isSeachOn
            ? IconButton(
                onPressed: _closeSeach,
                icon: Icon(Icons.arrow_back),
              )
            : null,
        title: _isSeachOn
            ? Expanded(
                child: TextField(
                  focusNode: _seachFocusNode,
                  minLines: 1,
                  onSubmitted: (value) => _init(),
                  onEditingComplete: _init,
                  controller: _searchControlller,
                  decoration: InputDecoration(
                    hintText: "Seach...",
                    border: InputBorder.none,
                  ),
                ),
              )
            : Text("Your teams!"),
        actions: [
          IconButton(
            onPressed: _showSearch,
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureListViewBuilder(
        onRefresh: () async => _init(),
        future: _future,
        type: 'teams',
        element: (e, i) {
          if (e.id == null) return SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Tooltip(
              message: e.name,
              child: InkWell(
                hoverColor: Color(0xFFC0C0C0),
                splashColor: Colors.green,
                onTap: () async => _navToTeam(e.id),
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
      _isSeachOn = false;
      _searchControlller.clear();
    });
  }

  Future<void> _createTeam() async {
    await createSmallForum(
      context: context,
      api: (s) async => await client.teams.create(s),
      type: 'team',
    );
    _init();
  }

  void _init() {
    setState(() {
      _future = client.teams.readList(_searchControlller.text);
    });
  }

  Future<void> _navToTeam(int? id) async {
    if (id == null) return;
    await nav(context, JobsListPage(id));
    _init();
  }

  void _showSearch() {
    if (_isSeachOn) {
      _init();
      return;
    }
    setState(() {
      _isSeachOn = true;
      _seachFocusNode.requestFocus();
    });
  }
}

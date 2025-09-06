import "package:flutter/material.dart";
import "package:job_manager_client/job_manager_client.dart";
import "package:job_manager_flutter/main.dart";
import "package:job_manager_flutter/widgets/del_btn.dart";
import "package:job_manager_flutter/widgets/edit_btn.dart";
import "package:job_manager_flutter/widgets/future_builder.dart";

class TeamUsersPage extends StatefulWidget {
  const TeamUsersPage(
    this.id, {
    super.key,
  });
  final int id;

  @override
  State<TeamUsersPage> createState() => _TeamUsersPageState();
}

class _TeamUsersPageState extends State<TeamUsersPage> {
  late Future<List<int>> _getTheUsers;
  late Future<CRUDUsersPermission> _getCRUDUsers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team_${widget.id}_users_page"),
      ),
      body: CustomFutureBuilder(
        future: _getCRUDUsers,
        success: (perms) => !perms.teamUserRead
            ? const Center(
                child: Text(
                  """Looks like you do not have the permissions to get the user list""",
                ),
              )
            : CustomFutureBuilder(
                future: _getTheUsers,
                success: (users) => ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(5),
                    child: Tooltip(
                      message: "${users[i]}",
                      child: InkWell(
                        hoverColor: const Color(0xFFC0C0C0),
                        splashColor: Colors.green,
                        onTap: _getMoreDetails,
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
                              Text(
                                "${users[i]}",
                              ),
                              const Spacer(),
                              if (perms.teamUserUpdate)
                                EditBtn(onPressed: _editUser),
                              if (perms.teamUserDelete)
                                DelBtn(onPressed: _deleteUser),
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

// TODO(xM1haix): _deleteUser.
  Future<void> _deleteUser() async {}
// TODO(xM1haix): finish this.
  Future<void> _editUser() async {}
// TODO(xM1haix): finish this.
  Future<void> _getMoreDetails() async {}

  void _init() {
    setState(() {
      _getTheUsers = client.teams.getTheUserList(widget.id);
      _getCRUDUsers = client.teams.getCRUDUsers(widget.id);
    });
  }
}

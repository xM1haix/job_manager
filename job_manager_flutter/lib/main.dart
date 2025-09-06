import "package:flutter/material.dart";
import "package:job_manager_client/job_manager_client.dart";
import "package:job_manager_flutter/pages/connect/connect.dart";
import "package:job_manager_flutter/pages/teams_list_page.dart";
import "package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";

void main() async {
  sessionManager = SessionManager(caller: client.modules.auth);
  await sessionManager.initialize();
  // await client.openStreamingConnection();
  runApp(const MyApp());
}

var client = Client(
  "http://$localhost:8080/",
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();
final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(centerTitle: true),
  scaffoldBackgroundColor: Colors.black,
  tooltipTheme: const TooltipThemeData(
    enableFeedback: true,
    textStyle: TextStyle(
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Colors.transparent,
    ),
  ),
);

late SessionManager sessionManager;

final theme = ThemeData(
  appBarTheme: const AppBarTheme(centerTitle: true),
  // scaffoldBackgroundColor: Colors.black,
  tooltipTheme: const TooltipThemeData(
    enableFeedback: true,
    textStyle: TextStyle(
        // color: Colors.white,
        ),
    decoration: BoxDecoration(
      color: Colors.transparent,
    ),
  ),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Work Manager",
      theme: theme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: sessionManager.isSignedIn ? const TeamsListPage() : const Connect(),
    );
  }

  @override
  void initState() {
    super.initState();
    sessionManager.addListener(() => setState(() {}));
    debugPrint(sessionManager.isSignedIn.toString());
  }
}

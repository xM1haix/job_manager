import 'package:flutter/material.dart';
import 'package:job_manager_client/job_manager_client.dart';
import 'package:job_manager_flutter/connect/connect.dart';
import 'package:job_manager_flutter/job_list.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

void main() async {
  sessionManager = SessionManager(caller: client.modules.auth);
  await sessionManager.initialize();
  // await client.openStreamingConnection();
  runApp(const MyApp());
}

var client = Client(
  'http://$localhost:8080/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();
late SessionManager sessionManager;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Manager',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(centerTitle: true),
        scaffoldBackgroundColor: Colors.black,
        tooltipTheme: TooltipThemeData(
          enableFeedback: true,
          textStyle: TextStyle(
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: sessionManager.isSignedIn ? const JobList() : const Connect(),
    );
  }

  @override
  void initState() {
    super.initState();
    sessionManager.addListener(() => setState(() {}));
    print(sessionManager.isSignedIn);
  }
}

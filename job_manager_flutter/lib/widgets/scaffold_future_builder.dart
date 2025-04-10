import 'package:flutter/material.dart';
import 'package:job_manager_flutter/widgets/future_builder.dart';

class ScaffoldFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Scaffold Function(T x) success;
  const ScaffoldFutureBuilder(
      {super.key, required this.future, required this.success});

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: future,
      success: (x) => success(x),
      error: (err) => Scaffold(
        appBar: AppBar(
          title: Text("Something went wrong"),
        ),
        body: Center(
          child: Text(
            err.toString(),
          ),
        ),
      ),
      loading: (loading) => Scaffold(
        appBar: AppBar(
          title: Text("Loading..."),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

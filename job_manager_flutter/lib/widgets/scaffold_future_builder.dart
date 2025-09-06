import "package:flutter/material.dart";
import "package:job_manager_flutter/widgets/future_builder.dart";

class ScaffoldFutureBuilder<T> extends StatelessWidget {
  const ScaffoldFutureBuilder({
    required this.future,
    required this.success,
    super.key,
  });
  final Future<T> future;
  final Scaffold Function(T x) success;

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: future,
      success: success,
      error: (err) => Scaffold(
        appBar: AppBar(
          title: const Text("Something went wrong"),
        ),
        body: Center(
          child: Text(
            err.toString(),
          ),
        ),
      ),
      loading: (loading) => Scaffold(
        appBar: AppBar(
          title: const Text("Loading..."),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

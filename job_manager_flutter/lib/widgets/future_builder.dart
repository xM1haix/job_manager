import "package:flutter/material.dart";
import "package:job_manager_client/job_manager_client.dart";

Widget _widget(Widget err) => Center(child: err);

class CustomFutureBuilder<T> extends StatelessWidget {
  const CustomFutureBuilder({
    required this.future,
    required this.success,
    super.key,
    this.error = _widget,
    this.loading = _widget,
  });
  final Future<T> future;
  final Widget Function(T e) success;
  final Widget Function(Widget err) error;

  final Widget Function(Widget loading) loading;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, s) => AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: s.hasError
            ? error(
                Text(
                  s.error is CustomException
                      ? (s.error! as CustomException).message
                      : s.error.toString(),
                ),
              )
            : !s.hasData
                ? loading(const CircularProgressIndicator())
                : success(s.data as T),
      ),
    );
  }
}

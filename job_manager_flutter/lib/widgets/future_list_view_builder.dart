import "package:flutter/material.dart";
import "package:job_manager_flutter/widgets/future_builder.dart";
import "package:job_manager_flutter/widgets/refresh_list_view_builder.dart";

class FutureListViewBuilder<T> extends StatefulWidget {
  const FutureListViewBuilder({
    required this.element,
    required this.type,
    required this.future,
    required this.onRefresh,
    super.key,
  });
  final Widget Function(T e, int i) element;
  final Future<List<T>> future;
  final Future<void> Function() onRefresh;
  final String type;

  @override
  State<FutureListViewBuilder<T>> createState() =>
      _FutureListViewBuilderState<T>();
}

class _FutureListViewBuilderState<T> extends State<FutureListViewBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: widget.future,
      success: (elements) => RefreshListViewBuilder(
        builder: widget.element,
        list: elements,
        onRefresh: widget.onRefresh,
        type: widget.type,
      ),
    );
  }
}

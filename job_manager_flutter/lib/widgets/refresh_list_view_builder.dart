import "package:flutter/material.dart";

class RefreshListViewBuilder<T> extends StatelessWidget {
  const RefreshListViewBuilder({
    required this.builder,
    required this.list,
    required this.onRefresh,
    required this.type,
    super.key,
  });
  final Widget Function(T e, int i) builder;
  final List<T> list;
  final Future<void> Function() onRefresh;
  final String type;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: list.isEmpty
          ? Center(
              child: Text("Looks like there is no $type!"),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) => builder(list[i], i),
            ),
    );
  }
}

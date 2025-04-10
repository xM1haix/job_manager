import 'package:flutter/material.dart';

class RefreshListViewBuilder<T> extends StatelessWidget {
  final Widget Function(T e, int i) element;
  final List<T> list;
  final Future<void> Function() onRefresh;
  final String type;
  const RefreshListViewBuilder(
      {super.key,
      required this.element,
      required this.list,
      required this.onRefresh,
      required this.type});

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
              itemBuilder: (context, i) => element(list[i], i),
            ),
    );
  }
}

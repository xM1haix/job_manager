import 'package:flutter/material.dart';

class DelBtn extends StatelessWidget {
  final void Function() onPressed;
  final double? size;
  const DelBtn({
    super.key,
    this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: DelIcon(),
    );
  }
}

class DelIcon extends StatelessWidget {
  final double? size;
  const DelIcon({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.delete_outline_rounded,
      size: size,
      color: Colors.red,
    );
  }
}

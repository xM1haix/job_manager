import "package:flutter/material.dart";

class DelBtn extends StatelessWidget {
  const DelBtn({
    required this.onPressed,
    super.key,
    this.size,
  });
  final void Function() onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const DelIcon(),
    );
  }
}

class DelIcon extends StatelessWidget {
  const DelIcon({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.delete_outline_rounded,
      size: size,
      color: Colors.red,
    );
  }
}

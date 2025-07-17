import 'package:flutter/material.dart';

class EditBtn extends StatelessWidget {
  final void Function() onPressed;
  final double? size;
  const EditBtn({super.key, this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: EditIcon(size: size),
    );
  }
}

class EditIcon extends StatelessWidget {
  final double? size;
  const EditIcon({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.edit_outlined,
      size: size,
      color: Colors.white,
    );
  }
}

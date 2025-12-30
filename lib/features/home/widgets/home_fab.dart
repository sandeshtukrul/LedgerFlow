import 'package:flutter/material.dart';

class HommeFab extends StatelessWidget {
  final VoidCallback onPressed;

  const HommeFab({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}

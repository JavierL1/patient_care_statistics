import 'package:flutter/material.dart';

class CoolButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double borderRadius;

  const CoolButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
      child: child,
    );
  }
}

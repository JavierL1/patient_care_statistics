import 'package:flutter/material.dart';

class CuteBox extends StatelessWidget {
  final Widget child;
  const CuteBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.purple.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const CircleIconButton({super.key, 
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        shape: const CircleBorder(),
        color: Colors.white,
        child: IconButton(
          icon: icon,
          iconSize: 30.0,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

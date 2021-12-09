import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    Key? key,
    required this.color,
    required this.label,
    required this.labelColor,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final String label;
  final Color labelColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // * Transparent space
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(width: 2, color: color),
      ),
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            splashColor: Colors.black,
            onTap: onPressed,
            child: Center(
              child: Text(
                label,
                style: TextStyle(color: labelColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

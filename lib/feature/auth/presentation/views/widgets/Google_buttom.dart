
import 'package:flutter/material.dart';

class GoogleButtom extends StatelessWidget {
  const GoogleButtom({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.4),
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'Goolge',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 31, 125, 202),
            ),
          ),
        ),
      ),
    );
  }
}

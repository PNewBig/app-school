import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;
  const LabelText({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.brown),
          child: Center(
              child: Text(
            label,
            style: TextStyle(
              color: Colors.lightGreenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )),
        ),
      ),
    );
  }
}

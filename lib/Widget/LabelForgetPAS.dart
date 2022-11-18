import 'package:flutter/material.dart';

class LabelPas extends StatelessWidget {
  final String labelPass;
  const LabelPas({required this.labelPass, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 250.0),
      child: Text(
        labelPass,
        style: TextStyle(
          //color: Color.fromARGB(255, 31, 41, 184),
          color: Color.fromARGB(255, 224, 138, 102),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

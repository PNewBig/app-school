import 'package:flutter/material.dart';

class InputTexfield extends StatelessWidget {
  final String text;
  const InputTexfield({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 218, 227, 208),
          border: Border.all(color: Color.fromARGB(255, 215, 200, 106)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
            ),
          ),
        ),
      ),
    );
  }
}

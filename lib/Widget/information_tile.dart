
import 'package:flutter/material.dart';

class InformationTile extends StatelessWidget {
  final String text;
  final String iconPath;
  final String informationName;

  const InformationTile({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.informationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 234, 231, 231),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      color: Color.fromARGB(255, 109, 178, 234),
                      child: Image.asset(
                        iconPath,
                        // color: Colors.grey[600],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Text(
                        informationName,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      //subtitle
                    ],
                  ),
                ],
              ),
              InkWell(
                  onTap: () {
                  },
                  child: const Icon(Icons.navigate_next)),
            ],
          ),
        ),
      ),
    );
  }
}

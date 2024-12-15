import 'package:flutter/material.dart';
import 'package:lab2/widgets/type/type_card_data.dart';

import '../../screens/joke.dart';

class TypeCard extends StatelessWidget {
  final String type;

  const TypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        enableFeedback: true,
        onTap: () {
          print("Selected Type: $type"); // Debug print
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JokeScreen(type: type),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey.withOpacity(0.8), width: 2),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TypeCardData(type: type),
        ),
      ),
    );
  }
}

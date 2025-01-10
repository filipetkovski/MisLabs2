import 'package:flutter/material.dart';

import '../../models/joke_model.dart';
import 'joke_card_data.dart';

class JokeCard extends StatelessWidget {
  final JokeModel joke;

  const JokeCard({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        enableFeedback: true,
        // onTap: () => {
        //   Navigator.pushNamed(context, "/joke",
        //       arguments: JokeModel(id: id, type: type, setup: setup, punchline: punchline))
        // },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey.withOpacity(0.8), width: 2),
              borderRadius: BorderRadius.circular(10)
          ),
          child: JokeCardData(joke: joke),
        ),
      ),
    );
  }
}

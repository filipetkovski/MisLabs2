import 'package:flutter/material.dart';
import 'package:lab2/widgets/joke/joke_card.dart';

import '../../models/joke_model.dart';

class JokeGrid extends StatefulWidget {
  final List<JokeModel> jokes;
  const JokeGrid({super.key, required this.jokes});

  @override
  State<JokeGrid> createState() => _JokeGridState();
}

class _JokeGridState extends State<JokeGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(padding: const EdgeInsets.all(30),
        crossAxisCount: 1,
        mainAxisSpacing: 30,
        semanticChildCount: 250,
        childAspectRatio: 200 / 200,
        shrinkWrap: true,
        children: widget.jokes.map((joke) =>
            JokeCard(
              id: joke.id,
              type: joke.type,
              setup: joke.setup,
              punchline: joke.punchline,
            )).toList()
    );
  }
}

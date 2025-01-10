import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/joke_model.dart';
import '../../providers/joke_provider.dart';

class JokeCardData extends StatelessWidget {
  final JokeModel joke;

  const JokeCardData({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        Text(joke.type, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),),
        const Divider(),
        Text(joke.setup, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),),
        const Divider(),
        Text(joke.punchline, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),),
      Align(
        alignment: Alignment.topRight,
        child: IconButton(
        // color: Colors.red,
        onPressed: () {
        context.read<JokeProvider>().toggleFavorite(joke);
        },
        color: joke.isFavorite ? Colors.red : Colors.blueGrey,
        icon: const Icon(Icons.favorite),
        ),
      ),
      ],
    );
  }


}


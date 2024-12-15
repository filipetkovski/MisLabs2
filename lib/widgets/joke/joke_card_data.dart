import 'package:flutter/material.dart';

import '../../models/joke_model.dart';

class JokeCardData extends StatelessWidget {
  final int id;
  final String type;
  final String setup;
  final String punchline;

  const JokeCardData({super.key, required this.id, required this.type,required this.setup, required this.punchline});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        Text(type, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),),
        const Divider(),
        Text(setup, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),),
        const Divider(),
        Text(punchline, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),)
      ],
    );
  }


}


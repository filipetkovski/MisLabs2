import 'package:flutter/material.dart';
import 'package:lab2/models/joke_model.dart';
import 'package:lab2/services/api_service.dart';
import 'package:lab2/widgets/joke/joke_grid.dart';

class JokeScreen extends StatelessWidget {
  final String type;

  JokeScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        centerTitle: true,
        title: Text(
          '${type[0].toUpperCase() + type.substring(1, type.length)} Jokes',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),),
      body: FutureBuilder<List<JokeModel>>(
        future: ApiService.getJokesFromJokeTypeApi(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return JokeGrid(jokes: snapshot.data!);
          }
        },
      ),
    );
  }
}

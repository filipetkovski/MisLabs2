import 'package:flutter/material.dart';
import 'dart:convert';


import '../models/joke_model.dart';
import '../services/api_service.dart';
import '../widgets/joke/joke_grid.dart';

class RandomJoke extends StatefulWidget {
  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  List<JokeModel> jokes = [];

  @override
  void initState() {
    super.initState();
    getRandomJokeFromAPI();
  }

  void getRandomJokeFromAPI() async {
    var response = await ApiService.getRandomJokeFromApi();
    var data = jsonDecode(response.body);
    setState(() {
      jokes.add(JokeModel.fromJson(data));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.refresh),
        //     color: Colors.white,
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/random');
        //     },
        //   ),
        // ],
        title: const Text("Joke for the day!", style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: JokeGrid(jokes: jokes),
    );
  }
}

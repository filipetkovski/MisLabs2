import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab2/models/joke_model.dart';

import '../services/api_service.dart';
import '../widgets/joke/joke_grid.dart';

class JokeScreen extends StatefulWidget {
  final String type;

  const JokeScreen({super.key, required this.type});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  List<JokeModel> jokes = [];

  @override
  void initState() {
    super.initState();
    print("Received Type: ${widget.type}");
    getJokeTypesFromAPI(widget.type);// Debug print
  }

  void getJokeTypesFromAPI(String type) async {
    var response = await ApiService.getJokesFromJokeTypeApi(type);
    var data = List.from(response);
    setState(() {
      jokes = data.asMap().entries.map<JokeModel>((element) {
        return JokeModel.fromJson(element.value);
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        actions: [
          IconButton(
            icon: Icon(Icons.add_card),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/random');
            },
          ),
        ],
        title: const Text("Joke for the day!", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: JokeGrid(jokes: jokes),
    );
  }
}

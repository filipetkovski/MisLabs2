import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab2/models/joke_model.dart';

import '../services/api_service.dart';
import '../widgets/joke/joke_grid.dart';
import '../widgets/type/type_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> types = [];

  @override
  void initState() {
    super.initState();
    getJokeTypesFromAPI();
  }

  void getJokeTypesFromAPI() async {
    var response = await ApiService.getJokeTypesFromApi();
    var data = List<String>.from(jsonDecode(response.body)); // Cast elements to List<String>
    setState(() {
      types = data;
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
      body: TypeGrid(types: types),
    );
  }
}

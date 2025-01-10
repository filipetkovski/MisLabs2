// import 'package:flutter/material.dart';
// import 'dart:convert';
//
//
// import '../models/joke_model.dart';
// import '../services/api_service.dart';
// import '../widgets/joke/joke_grid.dart';
//
// class RandomJoke extends StatefulWidget {
//   const RandomJoke({super.key});
//
//   @override
//   State<RandomJoke> createState() => _RandomJokeState();
// }
//
// class _RandomJokeState extends State<RandomJoke> {
//   List<JokeModel> jokes = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getRandomJokeFromAPI();
//   }
//
//   void getRandomJokeFromAPI() async {
//     var data = await ApiService.getRandomJokeFromApi();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent[100],
//         title: const Text("Joke for the day!", style: TextStyle(
//             color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: JokeGrid(jokes: jokes),
//     );
//   }
// }

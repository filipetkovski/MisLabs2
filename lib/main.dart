import 'package:flutter/material.dart';
import 'package:lab2/screens/home.dart';
import 'package:lab2/screens/joke.dart';
import 'package:lab2/screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
        '/random' : (context) => const RandomJoke()
      },
    );
  }

}
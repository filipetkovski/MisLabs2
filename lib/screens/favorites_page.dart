import 'package:flutter/material.dart';
import 'package:lab2/providers/joke_provider.dart';
import 'package:lab2/widgets/joke/joke_card.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<JokeProvider>().jokes.where(
          (p) => p.isFavorite,
    ).toList();
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: const Text("Jokes App",
        style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold)),
    centerTitle: true,
    leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
    ),
    body: favorites.isEmpty
        ? const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.heart_broken),
          SizedBox(
            height: 10,
          ),
          Text("You've no favorites yet."),
        ],
      ),
    )
        : GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      children: favorites.map(
            (joke) {
          return JokeCard(
            joke: joke,
          );
        },
      ).toList(),),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lab2/models/joke_model.dart';

class ApiService{

  static Future<List<String>> getJokeTypesFromApi() async {
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/types"));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  // static Future<JokeModel> getRandomJokeFromApi() async {
  //   var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> jokesJson = json.decode(response.body);
  //     return jokesJson.map((json) => JokeModel.fromJson(json));
  //   } else {
  //     throw Exception('Failed to load jokes by type');
  //   }
  // }

  static Future<List<JokeModel>> getJokesFromJokeTypeApi(String type) async{
    final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if (response.statusCode == 200) {
      final List<dynamic> jokesJson = json.decode(response.body);
      return jokesJson.map((json) => JokeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load jokes by type');
    }
  }
}

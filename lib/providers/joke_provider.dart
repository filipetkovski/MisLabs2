import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lab2/models/joke_model.dart';
import 'package:lab2/services/api_service.dart';
import 'package:path/path.dart' as path;

class JokeProvider extends ChangeNotifier {
  List<JokeModel> jokes = [];
  bool _isObscure = true;
  File? _img = null;

  JokeProvider() {
    initJokeTypesFromAPI();
  }

  void initJokeTypesFromAPI() async {
    List<String> jokeTypes = await ApiService.getJokeTypesFromApi();
    for(var jokeType in jokeTypes) {
      List<JokeModel> j = await ApiService.getJokesFromJokeTypeApi(jokeType);
      jokes.addAll(j);
    }
  }

  bool get isObscure => _isObscure;
  File? get image => _img;

  void toggleFavorite(JokeModel joke) {
    JokeModel realJoke = jokes.firstWhere((j) => j.setup == joke.setup && j.punchline == joke.punchline);
    realJoke.isFavorite = !realJoke.isFavorite;
    notifyListeners();
  }

  void toggleVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try{
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _img = File(pickedFile.path);
        print(_img!.path);
        notifyListeners();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadImage() async {
    if (_img == null) return;
    notifyListeners();
    try {
      String fileName = path.basename(_img!.path);
      Reference storageRef = FirebaseStorage.instance.ref().child('profile_pictures/$fileName');
      await storageRef.putFile(_img!);
      String downloadUrl = await storageRef.getDownloadURL();
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(downloadUrl);
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      notifyListeners();
    }
  }
}


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appdev_spring_25/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterProvider with ChangeNotifier {
  bool isLoading = false;
  List<Character> characters = [];

  Future<void> fetchCharacters() async {
    isLoading = true;
    notifyListeners();
    try {
      var url = "https://api.sampleapis.com/avatar/characters";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> _response = json.decode(response.body);
        characters = _response
            .map((character) => Character.fromJson(character))
            .toList();
      }
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

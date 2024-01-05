import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttersinav/model/character.dart';

class MainViewModel with ChangeNotifier {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";

  List<Character> _characters = [];

  List<Character> get characters => _characters;

  MainViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCharacters();
    });
  }

  void _getCharacters() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    Map<String, dynamic> data = jsonDecode(response.body);

    if (data.containsKey('results') && data['results'] is List) {
      List<Map<String, dynamic>> characterList =
          List<Map<String, dynamic>>.from(data['results']);

      for (Map<String, dynamic> characterMap in characterList) {
        Character character = Character.fromMap(characterMap);
        _characters.add(character);
      }

      notifyListeners();
    } else {}
  }
}

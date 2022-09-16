import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_rick_and_morty/home/models/character.dart';
import 'package:flutter_rick_and_morty/home/repositories/home-api-repository.dart';
import 'package:http/http.dart';

class HomeController {
  final homeApiRepository = HomeRepository();

  Future<List<CharacterDTO>> getCharacters() async {
    final response = await homeApiRepository.getCharacters();
    List<CharacterDTO> characters = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      final Map dataFromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromAPI['results'];

      characters = charactersResults
          .map((character) => CharacterDTO.fromJson(character))
          .toList();
    }
    return characters;
  }
}

final homeController = HomeController();

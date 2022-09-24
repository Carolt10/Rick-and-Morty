import 'package:flutter/cupertino.dart';

class CharacterDTO {
  int id;
  String name;
  String image;
  String status;
  String species;
  String gender;
  String location;
  String type;
  String debut;
  bool isFavorite;

  CharacterDTO.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        species = json['species'],
        status = json['status'],
        image = json['image'],
        gender = json['gender'],
        location = json['location']['name'],
        type = json['type'],
        debut = json['origin']['name'],
        isFavorite = false;
}

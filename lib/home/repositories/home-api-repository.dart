import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  final String api = 'https://rickandmortyapi.com/api/';

  get application => null;

  get json => null;

  // ignore: non_constant_identifier_names
  Future<http.Response> getCharacters() async {
    Uri uri = Uri.parse('${api}character/');
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json charset=UTF-8',
    });
  }
}

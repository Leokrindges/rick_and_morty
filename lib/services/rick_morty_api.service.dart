import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_response.model.dart';

class RickMortyApiService {
  late final Dio dio;

  RickMortyApiService() {
    dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));
  }

  Future<CharacterResponse> loadCharacters({required int page}) async {
    try {
      final response = await dio.get('/character/?page=$page');
      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Failed to load characters');
      }
      return CharacterResponse.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

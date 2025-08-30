import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/models/info.model.dart';

class CharacterResponse {
  final Info info;
  final List<Character> results;

  CharacterResponse({required this.info, required this.results});

  factory CharacterResponse.fromMap(Map<String, dynamic> map) {
    return CharacterResponse(
      info: Info.fromMap(map['info'] ?? {}),
      results: List<Character>.from(map['results']?.map((x) => Character.fromMap(x)) ?? []),
    );
  }
}

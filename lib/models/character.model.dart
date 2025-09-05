import 'package:rick_and_morty/models/location.model.dart';
import 'package:rick_and_morty/models/origin.model.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final Origin origin;
  final Location location;
  final List<String> episodeUrls;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episodeUrls,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      type: map['type'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
      origin: Origin.fromMap(map['origin'] ?? {}),
      location: Location.fromMap(map['location'] ?? {}),
      episodeUrls: List<String>.from(map['episode'] ?? []),
    );
  }
}

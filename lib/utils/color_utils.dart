import 'package:flutter/material.dart';
import 'package:colorgram/colorgram.dart';

Future<Color> getDominantColorFromImage(String imageUrl) async {
  ImageProvider provider = NetworkImage(imageUrl);
  List<CgColor> colorList = await extractColor(provider, 2);
  final CgColor dominant = colorList.firstWhere(
    (c) => !(c.r < 30 && c.g < 30 && c.b < 30),
    orElse: () => colorList.first,
  );
  return Color.fromARGB(255, dominant.r, dominant.g, dominant.b);
}

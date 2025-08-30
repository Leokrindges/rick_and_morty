import 'package:flutter/material.dart';
import 'package:rick_and_morty/colors.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/utils/color_utils.dart';

class CharacterGridCard extends StatefulWidget {
  final Character character;
  const CharacterGridCard({super.key, required this.character});

  @override
  State<CharacterGridCard> createState() => _CharacterGridCardState();
}

class _CharacterGridCardState extends State<CharacterGridCard> {
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    getPaletteColor();
  }

  Future<void> getPaletteColor() async {
    Color dominant = await getDominantColorFromImage(widget.character.image);
    setState(() {
      backgroundColor = dominant;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.character.id.toString(),
              style: TextStyle(color: primaryColor),
            ),
            SizedBox(height: 10),
            Image.network(
              widget.character.image,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.character.name,
                style: TextStyle(color: primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

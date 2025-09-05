import 'package:flutter/material.dart';
import 'package:rick_and_morty/colors.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/utils/color_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharacterListCard extends StatefulWidget {
  final Character character;
  const CharacterListCard({super.key, required this.character});

  @override
  State<CharacterListCard> createState() => _CharacterListCardState();
}

class _CharacterListCardState extends State<CharacterListCard> {
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
    Color statusColor;
    switch (widget.character.status.toLowerCase()) {
      case 'alive':
        statusColor = Colors.green;
        break;
      case 'dead':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      elevation: 4,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: ValueKey(widget.character.id),
                child: CachedNetworkImage(
                  imageUrl: widget.character.image,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.character.name,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${widget.character.status} - ${widget.character.species}',
                            style: TextStyle(color: primaryColor),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Text(
                      widget.character.gender,
                      style: TextStyle(color: primaryColor),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          widget.character.id.toString(),
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/utils/color_utils.dart';

class DetailPage extends StatefulWidget {
  final Character character;

  const DetailPage({super.key, required this.character});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: backgroundColor,
            floating: true,
            expandedHeight: 300,
            collapsedHeight: 60,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.character.id,
                child: Image.network(widget.character.image),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '${widget.character.name.toUpperCase()} | #${widget.character.id}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        Hero(
                          tag: '${widget.character.id}-status',
                          child: Chip(
                            backgroundColor: Colors.lightBlue[200],
                            side: BorderSide.none,
                            label: Text(
                              widget.character.status,
                              style: const TextStyle(fontSize: 12),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 0,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                        Hero(
                          tag: '${widget.character.id}-species',
                          child: Chip(
                            side: BorderSide.none,
                            backgroundColor: Colors.lightBlue[200],
                            label: Text(
                              widget.character.species,
                              style: const TextStyle(fontSize: 12),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 0,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                        Hero(
                          tag: '${widget.character.id}-gender',
                          child: Chip(
                            backgroundColor: Colors.lightBlue[200],
                            side: BorderSide.none,
                            label: Text(
                              widget.character.gender,
                              style: const TextStyle(fontSize: 12),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 0,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Última localização conhecida:',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.character.location.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Local de origem:',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.character.origin.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Quantidade de vezes que apareceu:',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.character.episodeUrls.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

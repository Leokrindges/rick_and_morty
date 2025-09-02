import 'package:flutter/material.dart';
import 'package:rick_and_morty/colors.dart';
import 'package:rick_and_morty/pages/stores/home.store.dart';
import 'package:rick_and_morty/widgets/character_grid_card.widget.dart';
import 'package:rick_and_morty/widgets/character_list_card.widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();
  bool isGrid = false;
  Color cardColors = Colors.white;
  final scrollController = ScrollController();

  @override
  void initState() {
    store.loadCharacters();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        store.loadCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rick and Morty',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Procure pelo seu personagem',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  hintText: 'Nome ou identificador',
                  hintStyle: TextStyle(color: primaryColor),
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.search, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    icon: Icon(
                      isGrid ? Icons.list : Icons.grid_view,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Observer(
                builder: (context) {
                  return Expanded(
                    child: isGrid
                        ? GridView.builder(
                            controller: scrollController,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 3,
                                ),
                            itemCount: store.characters.length,
                            itemBuilder: (context, index) {
                              if (index < store.characters.length) {
                                final character = store.characters[index];

                                return InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    // Handle tap
                                  },
                                  child: CharacterGridCard(
                                    character: character,
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          )
                        : ListView.builder(
                            controller: scrollController,
                            itemCount: store.characters.length,
                            itemBuilder: (context, index) {
                              if (index < store.characters.length) {
                                final character = store.characters[index];
                                return InkWell(
                                  onTap: () {
                                    // Handle tap
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: CharacterListCard(
                                    character: character,
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

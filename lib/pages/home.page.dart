import 'package:flutter/material.dart';
import 'package:rick_and_morty/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = false;
  final List<String> personagens = [
    'Rick Sanchez',
    'Morty Smith',
    'Summer Smith',
    'Beth Smith',
    'Jerry Smith',
    'Birdperson',
    'Squanchy',
    'Mr. Meeseeks',
  ];

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
              Expanded(
                child: isGrid
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2 / 3,
                        ),
                        itemCount: personagens.length,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              personagens[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: personagens.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            heightFactor: 4,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                personagens[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

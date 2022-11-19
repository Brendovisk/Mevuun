import 'package:flutter/material.dart';
import 'package:meevun_2/search_all_games_page.dart';

import 'add_new_game_page.dart';

class AllGamesPage extends StatefulWidget {
  const AllGamesPage({super.key});

  @override
  State<AllGamesPage> createState() => AllGamesPageState();
}

class AllGamesPageState extends State<AllGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "All Games",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 35, 20, 0),
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                  ),
                  tooltip: 'Search for a game',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SearchAllGames(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddNewgame(),
            ),
          );
        },
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: (Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              Card(
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.surfaceVariant,
                  onTap: () {
                    debugPrint("Card Clicked");
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: Image.network(
                            'https://media.rawg.io/media/resize/1920/-/screenshots/dc5/dc5d251100154f7502b4b8510591cc5d.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                          child: Text(
                            "Cuphead",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.surfaceVariant,
                  onTap: () {
                    debugPrint("Card Clicked");
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: Image.network(
                            'https://media.rawg.io/media/resize/1920/-/screenshots/dc5/dc5d251100154f7502b4b8510591cc5d.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                          child: Text(
                            "Cuphead",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.surfaceVariant,
                  onTap: () {
                    debugPrint("Card Clicked");
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: Image.network(
                            'https://media.rawg.io/media/resize/1920/-/screenshots/dc5/dc5d251100154f7502b4b8510591cc5d.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                          child: Text(
                            "Cuphead",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

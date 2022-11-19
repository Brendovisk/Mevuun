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
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
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
                margin: const EdgeInsets.only(bottom: 20),
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.surfaceVariant,
                  onTap: () {
                    debugPrint("Card Clicked");
                  },
                  child: SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: Image.network(
                            "https://media.rawg.io/media/crop/600/400/games/1c3/1c305096502c475c00276c827f0fd697.jpg",
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 15,
                          child: Text(
                            "God of War".toUpperCase(),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 120,
                          child: FloatingActionButton(
                            child: const Icon(Icons.star_outline),
                            onPressed: () {
                              debugPrint("Make favorite");
                            },
                          ),
                        ),
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

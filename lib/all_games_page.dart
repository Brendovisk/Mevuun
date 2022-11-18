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
    );
  }
}

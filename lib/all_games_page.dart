import 'package:flutter/material.dart';

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

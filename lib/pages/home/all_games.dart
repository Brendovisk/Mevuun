import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meevun_2/pages/search/search.dart';
import 'add_new_game.dart';
import 'package:http/http.dart' as http;

class AllGamesPage extends StatefulWidget {
  const AllGamesPage({super.key});

  @override
  State<AllGamesPage> createState() => AllGamesPageState();
}

class AllGamesPageState extends State<AllGamesPage> {
  List gamesDecoded = [];
  List names = [];
  List descriptions = [];
  List images = [];

  Future<List> showAllGames() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/api/v1/games'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzhiNGRhNWQwMDVlM2JhOGU3OTg1YjAiLCJlbWFpbCI6ImJyZW5kb24uZnJhbmNvbGl2ZWlyYUBnbWFpbC5jb20iLCJpYXQiOjE2NzAwNzg4MDAsImV4cCI6MTY3MDY4MzYwMH0.yPRTZKfSntGzfyerTpg4YzN9xXEjiS0xbaPHAfHFDDo',
        },
      );

      gamesDecoded = json.decode(response.body) as List;
      names = gamesDecoded.map<String>((e) => e['name']).toList();
      descriptions = gamesDecoded.map<String>((e) => e['description']).toList();
      images = gamesDecoded.map<String>((e) => e['image']).toList();
    } catch (e) {
      // ignore: avoid_print
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    showAllGames();
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
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddNewgame(),
              ),
            );
          },
          heroTag: null,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children = [];

          Timer(
            const Duration(seconds: 1),
            () {
              for (var name in names) {
                children.add(Text(name));
              }
            },
          );

          return ListView(
            children: [
              Column(
                children: children,
              ),
            ],
          );
        },
      ),
    );
  }
}

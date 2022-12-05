import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meevun_2/pages/search/search.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'add_new_game.dart';
import 'package:http/http.dart' as http;

import 'game_view.dart';

class AllGamesPage extends StatefulWidget {
  const AllGamesPage({super.key});

  @override
  State<AllGamesPage> createState() => AllGamesPageState();
}

class AllGamesPageState extends State<AllGamesPage> {
  List gamesDecoded = [];

  Future<List> showAllGames() async {
    await Future.delayed(const Duration(seconds: 1));

    final response = await http.get(
      Uri.parse('http://localhost:3000/api/v1/games'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzhiNGRhNWQwMDVlM2JhOGU3OTg1YjAiLCJlbWFpbCI6ImJyZW5kb24uZnJhbmNvbGl2ZWlyYUBnbWFpbC5jb20iLCJpYXQiOjE2NzAwNzg4MDAsImV4cCI6MTY3MDY4MzYwMH0.yPRTZKfSntGzfyerTpg4YzN9xXEjiS0xbaPHAfHFDDo',
      },
    );

    gamesDecoded = json.decode(response.body) as List;

    return gamesDecoded;
  }

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
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddNewGame(),
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
        future: showAllGames(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List allGames = snapshot.data!;
            List names = allGames.map<String>((e) => e['name']).toList();
            List images = allGames.map<String>((e) => e['image']).toList();

            return ListView(
              children: [
                ResponsiveGridRow(
                  children: [
                    for (int i = 0; i < allGames.length; i++)
                      ResponsiveGridCol(
                        lg: 3,
                        md: 6,
                        xs: 12,
                        child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            splashColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const GameViewPage(),
                                ),
                              );
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
                                      child: FadeInImage.assetNetwork(
                                        fadeInDuration:
                                            const Duration(milliseconds: 1500),
                                        placeholder:
                                            'assets/images/placeholder.jpg',
                                        image: images[i],
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )),
                                  Positioned(
                                    bottom: 30,
                                    left: 15,
                                    child: Text(
                                      names[i].toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    bottom: 110,
                                    child: FloatingActionButton(
                                      heroTag: null,
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
                      ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

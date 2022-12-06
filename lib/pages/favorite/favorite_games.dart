import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meevun_2/pages/home/game_view.dart';
import 'package:meevun_2/pages/search/search.dart';
import 'package:http/http.dart' as http;
import 'package:meevun_2/providers/game_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FavoriteGamesPage extends StatefulWidget {
  const FavoriteGamesPage({super.key});

  @override
  State<FavoriteGamesPage> createState() => _FavoriteGamesPageState();
}

class _FavoriteGamesPageState extends State<FavoriteGamesPage> {
  List gamesDecoded = [];

  Future<List> showFavoriteGames() async {
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
    final gameService = Provider.of<GameView>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Favorite Games",
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
      body: FutureBuilder(
        future: showFavoriteGames(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List allGames = snapshot.data!;
            List names = allGames.map<String>((e) => e['name']).toList();
            List images = allGames.map<String>((e) => e['image']).toList();
            List likeds = allGames.map<bool>((e) => e['liked']).toList();

            return ListView(
              children: [
                ResponsiveGridRow(
                  children: [
                    for (int i = 0; i < allGames.length; i++)
                      if (likeds[i] == true)
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
                                gameService.setI(i);
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
                                          fadeInDuration: const Duration(
                                              milliseconds: 1500),
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

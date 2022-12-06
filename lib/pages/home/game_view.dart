import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:meevun_2/providers/game_provider.dart';
import 'package:provider/provider.dart';

class GameViewPage extends StatefulWidget {
  const GameViewPage({super.key});

  @override
  State<GameViewPage> createState() => _GameViewPageState();
}

class _GameViewPageState extends State<GameViewPage> {
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
    final gameService = Provider.of<GameView>(context);

    showAllGames();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
            child: PopupMenuButton<Text>(
              itemBuilder: (content) {
                return [
                  PopupMenuItem(
                    height: 46,
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                          ),
                        ),
                        icon: const Icon(Icons.edit),
                        label: const Text("Edit"),
                        onPressed: () {
                          debugPrint("Edit game");
                        },
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    height: 46,
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                          ),
                        ),
                        icon: const Icon(Icons.delete),
                        label: const Text("Delete"),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Delete game'),
                            content: const Text('Are you sure about that?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
        toolbarHeight: 72,
        title: Text(
          ("Game").toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: showAllGames(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List allGames = snapshot.data!;
            List name = allGames.map<String>((e) => e['name']).toList();
            List description =
                allGames.map<String>((e) => e['description']).toList();
            List images = allGames.map<String>((e) => e['image']).toList();

            return ListView(
              children: [
                FadeInImage.assetNetwork(
                  fadeInDuration: const Duration(milliseconds: 1500),
                  placeholder: 'assets/images/placeholder.jpg',
                  image: images[gameService.i],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                    ),
                    readOnly: true,
                    maxLines: 1,
                    initialValue: name[gameService.i],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Description",
                    ),
                    readOnly: true,
                    maxLines: 10,
                    initialValue: description[gameService.i],
                  ),
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
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () {
          debugPrint("Add to favorites");
        },
        label: const Text("Add to favorites"),
        icon: const Icon(Icons.star_outline),
      ),
    );
  }
}

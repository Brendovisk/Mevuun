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

  Future<List> showGame() async {
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

  Future<String> likeGame(String id) async {
    try {
      final http.Response response = await http.patch(
        Uri.parse('localhost:3000/api/v1/games/like/$id'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzhiNGRhNWQwMDVlM2JhOGU3OTg1YjAiLCJlbWFpbCI6ImJyZW5kb24uZnJhbmNvbGl2ZWlyYUBnbWFpbC5jb20iLCJpYXQiOjE2NzAwNzg4MDAsImV4cCI6MTY3MDY4MzYwMH0.yPRTZKfSntGzfyerTpg4YzN9xXEjiS0xbaPHAfHFDDo',
        },
      );
      // ignore: avoid_print
      print(response.statusCode);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return "";
  }

  Future<String> unlikedGame(String id) async {
    try {
      final http.Response response = await http.patch(
        Uri.parse('localhost:3000/api/v1/games/unlike/$id'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzhiNGRhNWQwMDVlM2JhOGU3OTg1YjAiLCJlbWFpbCI6ImJyZW5kb24uZnJhbmNvbGl2ZWlyYUBnbWFpbC5jb20iLCJpYXQiOjE2NzAwNzg4MDAsImV4cCI6MTY3MDY4MzYwMH0.yPRTZKfSntGzfyerTpg4YzN9xXEjiS0xbaPHAfHFDDo',
        },
      );

      // ignore: avoid_print
      print(response.statusCode);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return "";
  }

  Future<http.Response> deleteGame(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://localhost:3000/api/v1/games/$id'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzhiNGRhNWQwMDVlM2JhOGU3OTg1YjAiLCJlbWFpbCI6ImJyZW5kb24uZnJhbmNvbGl2ZWlyYUBnbWFpbC5jb20iLCJpYXQiOjE2NzAwNzg4MDAsImV4cCI6MTY3MDY4MzYwMH0.yPRTZKfSntGzfyerTpg4YzN9xXEjiS0xbaPHAfHFDDo',
      },
    );

    return response;
  }

  @override
  Widget build(BuildContext context) {
    final gameService = Provider.of<GameView>(context);

    showGame();

    return FutureBuilder(
      future: showGame(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List allGames = snapshot.data!;
          List name = allGames.map<String>((e) => e['name']).toList();
          List description =
              allGames.map<String>((e) => e['description']).toList();
          List images = allGames.map<String>((e) => e['image']).toList();
          List id = allGames.map<String>((e) => e['_id']).toList();
          List liked = allGames.map<bool>((e) => e['liked']).toList();

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
                              icon: const Icon(Icons.delete),
                              label: const Text("Delete"),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Delete game'),
                                  content:
                                      const Text('Are you sure about that?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        deleteGame(id[gameService.i]);
                                        Navigator.pop(context);
                                      },
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
            body: ListView(
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
            ),
            floatingActionButton: FloatingActionButton.extended(
              heroTag: null,
              label: const Text("Add to favorites"),
              icon: const Icon(Icons.star_outline),
              onPressed: () {
                if (liked[gameService.i] == true) {
                  unlikedGame(id[gameService.i]);
                } else {
                  likeGame(id[gameService.i]);
                }
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

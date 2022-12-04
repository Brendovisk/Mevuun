import 'package:flutter/material.dart';
import 'package:meevun_2/pages/home/game_view.dart';
import 'package:meevun_2/pages/search/search.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../models/token_usuarios.dart';
import 'add_new_game.dart';
import 'package:http/http.dart' as http;

class AllGamesPage extends StatefulWidget {
  const AllGamesPage({super.key});

  @override
  State<AllGamesPage> createState() => AllGamesPageState();
}

class AllGamesPageState extends State<AllGamesPage> {
  String auxiliar = "";
  
  Future<String> createLoginState(String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/api/v1/games'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $auxiliar',
        },
      );
      print(response.body);
    } catch (e) {
      print(e);
    }

    return "string vazia";
  }

  @override
  Widget build(BuildContext context) {
    final tokenUsuarioGlobal = Provider.of<tokenUsuario>(context);
    String token = tokenUsuarioGlobal.getToken();
    auxiliar = token;

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
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          children: [
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  lg: 3,
                  md: 6,
                  xs: 12,
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: InkWell(
                      splashColor: Theme.of(context).colorScheme.surfaceVariant,
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
                              right: 10,
                              bottom: 110,
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

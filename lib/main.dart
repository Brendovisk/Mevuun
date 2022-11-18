import 'package:flutter/material.dart';
import 'package:meevun_2/all_games_page.dart';
import 'package:meevun_2/favorite_games_page.dart';
import 'package:meevun_2/profile_page.dart';
import 'package:meevun_2/search_all_games_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, box, child) {
        final isDark = box.get('isDark', defaultValue: false);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark
              ? ThemeData(
                  colorSchemeSeed: const Color(0xff6750a4),
                  useMaterial3: true,
                  brightness: Brightness.dark,
                )
              : ThemeData(
                  colorSchemeSeed: const Color(0xff6750a4),
                  useMaterial3: true,
                  brightness: Brightness.light,
                ),
          home: const AllGames(),
        );
      },
    );
  }
}

class AllGames extends StatefulWidget {
  const AllGames({super.key});

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
  // Load the page according to the selected BottomNavigationBarItem
  int _currentPage = 0;
  List<Widget> pages = const [
    AllGamesPage(),
    FavoriteGamesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
        body: pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedFontSize: 11,
          selectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
          currentIndex: _currentPage,
          onTap: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}

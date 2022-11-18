import 'package:flutter/material.dart';
import 'package:meevun_2/all_games_page.dart';
import 'package:meevun_2/favorite_games_page.dart';
import 'package:meevun_2/profile_page.dart';
import 'package:meevun_2/search_all_games_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllGames(),
    );
  }
}

class AllGames extends StatefulWidget {
  const AllGames({super.key});

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
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
          backgroundColor: const Color(0xfffafafa),
          shadowColor: Colors.transparent,
          toolbarHeight: 90,
          title: const Text(
            "All Games",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black87,
                      size: 30,
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
          selectedItemColor: Colors.blue,
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

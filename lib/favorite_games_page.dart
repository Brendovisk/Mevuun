import 'package:flutter/material.dart';

class FavoriteGamesPage extends StatefulWidget {
  const FavoriteGamesPage({super.key});

  @override
  State<FavoriteGamesPage> createState() => _FavoriteGamesPageState();
}

class _FavoriteGamesPageState extends State<FavoriteGamesPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Favorite page"),
    );
  }
}

import 'package:flutter/material.dart';

class SearchAllGames extends StatelessWidget {
  const SearchAllGames({super.key});

  static const List<String> _gameOptions = <String>[
    'apex legends',
    'blitz brigade',
    'cuphead',
    'detroit become human',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        toolbarHeight: 72,
        title: const Text(
          "Search for a game",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              children: [
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return _gameOptions.where((String option) {
                      return option
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                ),
              ],
            ),
            const Positioned(
              right: 0,
              child: Icon(Icons.search, size: 30),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GameViewPage extends StatelessWidget {
  const GameViewPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          "God of War".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: const Center(child: Text("Hello")),
    );
  }
}

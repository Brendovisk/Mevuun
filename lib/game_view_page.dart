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
      body: ListView(
        children: [
          Image.network(
            "https://media.rawg.io/media/crop/600/400/games/1c3/1c305096502c475c00276c827f0fd697.jpg",
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write the description of the game",
                labelText: "Description",
              ),
              readOnly: true,
              maxLines: 10,
              initialValue:
                  "Kratos and Atreus must journey to each of the Nine Realms in search of answers as they prepare for the prophesied battle that will end the world. Together, Kratos and Atreus venture deep into the Nine Realms in search of answers as Asgardian forces prepare for war. Along the way they will explore stunning, mythical landscapes, gather allies from across the realms, and face fearsome enemies in the form of Norse gods and monsters. As the threat of Ragnarök grows ever closer, Kratos and Atreus find themselves choosing between the safety of their family and the safety of the realms...",
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          debugPrint("Add to favorites");
        },
        label: const Text("Add to favorites"),
        icon: const Icon(Icons.star_outline),
      ),
    );
  }
}

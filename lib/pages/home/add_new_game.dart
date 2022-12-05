import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddNewGame extends StatefulWidget {
  const AddNewGame({super.key});

  @override
  State<AddNewGame> createState() => _AddNewGameState();
}

class _AddNewGameState extends State<AddNewGame> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerImage = TextEditingController();

  Future<http.Response> addGame(
      String image, String name, String description) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/v1/games/'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzhiNGRhNWQwMDVlM2JhOGU3OTg1YjAiLCJlbWFpbCI6ImJyZW5kb24uZnJhbmNvbGl2ZWlyYUBnbWFpbC5jb20iLCJpYXQiOjE2NzAwNzg4MDAsImV4cCI6MTY3MDY4MzYwMH0.yPRTZKfSntGzfyerTpg4YzN9xXEjiS0xbaPHAfHFDDo',
      },
      body: {
        'name': name,
        'description': description,
        'image': image,
      },
    );

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        title: const Text(
          "Add new game",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextFormField(
              controller: _controllerImage,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Paste the URL of the image",
                labelText: "Image",
              ),
              readOnly: false,
              maxLines: 1,
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: _controllerName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write the full name of the game",
                labelText: "Full Name",
              ),
              readOnly: false,
              maxLines: 1,
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: _controllerDescription,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write the description of the game",
                labelText: "Description",
              ),
              readOnly: false,
              maxLines: 6,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    debugPrint("Return to the previous screen");
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        addGame(
                          _controllerImage.text,
                          _controllerName.text,
                          _controllerDescription.text,
                        );
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(22, 8, 22, 8),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

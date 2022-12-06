import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List userDecoded = [];

  Future<List> listUser() async {
    await Future.delayed(const Duration(seconds: 1));

    final response = await http.get(
      Uri.parse('localhost:3000/api/v1/users/638d0053bfc8025d82cd6165'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzhiNGRhNWQwMDVlM2JhOGU3OTg1YjAiLCJlbWFpbCI6ImJyZW5kb24uZnJhbmNvbGl2ZWlyYUBnbWFpbC5jb20iLCJpYXQiOjE2NzAwNzg4MDAsImV4cCI6MTY3MDY4MzYwMH0.yPRTZKfSntGzfyerTpg4YzN9xXEjiS0xbaPHAfHFDDo',
      },
    );

    userDecoded = json.decode(response.body) as List;

    return userDecoded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
      ),
      body: (ValueListenableBuilder(
        valueListenable: Hive.box('settings').listenable(),
        builder: (context, box, child) {
          final isDark = box.get('isDark', defaultValue: false);
          bool enabledDarkMode = isDark;

          return FutureBuilder(
            future: listUser(),
            builder: (context, snapshot) {
              return Stack(
                children: [
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            TextFormField(
                              readOnly: true,
                              initialValue: "John",
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "John",
                              ),
                            ),
                            const SizedBox(height: 28),
                            TextFormField(
                              readOnly: true,
                              initialValue: "Doe",
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Doe",
                              ),
                            ),
                            const SizedBox(height: 28),
                            TextFormField(
                              readOnly: true,
                              initialValue: "john@gmail.com",
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "john@gmail.com",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton.extended(
                      heroTag: null,
                      label: enabledDarkMode
                          ? const Text("Light Theme")
                          : const Text('Dark Theme'),
                      icon: enabledDarkMode
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                      elevation: 1,
                      onPressed: () {
                        setState(() {
                          if (enabledDarkMode == true) {
                            box.put('isDark', false);
                          } else {
                            box.put('isDark', true);
                          }
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      )),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            if (_isDarkTheme == false) {
              _isDarkTheme = true;
            } else {
              _isDarkTheme = false;
            }
          });
        },
        child: _isDarkTheme
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
      ),
    );
  }
}

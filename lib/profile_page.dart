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
      floatingActionButton: FloatingActionButton.extended(
        label:
            _isDarkTheme ? const Text("Light Theme") : const Text('Dark Theme'),
        backgroundColor: _isDarkTheme ? Colors.white : Colors.black,
        foregroundColor: _isDarkTheme ? Colors.black87 : Colors.white70,
        splashColor: Colors.blue,
        onPressed: () {
          setState(() {
            if (_isDarkTheme == false) {
              _isDarkTheme = true;
            } else {
              _isDarkTheme = false;
            }
          });
        },
        icon: _isDarkTheme
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
      ),
    );
  }
}

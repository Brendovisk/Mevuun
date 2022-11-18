import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (ValueListenableBuilder(
        valueListenable: Hive.box('settings').listenable(),
        builder: (context, box, child) {
          final isDark = box.get('isDark', defaultValue: false);
          bool enabledDarkMode = isDark;
          return Stack(
            children: [
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton.extended(
                  label: enabledDarkMode
                      ? const Text("Light Theme")
                      : const Text('Dark Theme'),
                  backgroundColor:
                      enabledDarkMode ? Colors.white : Colors.black,
                  foregroundColor:
                      enabledDarkMode ? Colors.black87 : Colors.white70,
                  icon: enabledDarkMode
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
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
      )),
    );
  }
}

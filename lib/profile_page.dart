import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meevun_2/profile_edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                size: 28,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileEditPage(),
                  ),
                );
              },
            ),
          ),
        ],
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
          return Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("images/placeholder-profile.png",
                              width: 160, height: 160),
                        ),
                        const SizedBox(height: 28),
                        TextFormField(
                          readOnly: true,
                          initialValue: "John Doe",
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Full Name",
                          ),
                        ),
                        const SizedBox(height: 28),
                        TextFormField(
                          readOnly: true,
                          initialValue: "john.doe@email.com",
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email Address",
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
      )),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("images/placeholder-profile.png",
                          width: 160, height: 160),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const SizedBox(
                          width: 30,
                          height: 30,
                          child: ColoredBox(
                            color: Colors.black,
                            child:
                                Icon(Icons.edit, color: Colors.white, size: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                TextFormField(
                  readOnly: false,
                  initialValue: "John Doe",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Full Name",
                  ),
                ),
                const SizedBox(height: 28),
                TextFormField(
                  readOnly: false,
                  initialValue: "john.doe@email.com",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email Address",
                  ),
                ),
                const SizedBox(height: 28),
                TextFormField(
                  readOnly: false,
                  initialValue: "password123",
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              _isObscure = !_isObscure;
                            },
                          );
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
                const SizedBox(height: 28),
                TextFormField(
                  readOnly: false,
                  initialValue: "password123",
                  obscureText: _isObscure,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Re-type Password",
                  ),
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
                        debugPrint("Save game");
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
        ],
      ),
    );
  }
}

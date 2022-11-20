import 'package:flutter/material.dart';

class AddNewgame extends StatelessWidget {
  const AddNewgame({super.key});

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
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Click to add a banner"),
                const SizedBox(height: 8),
                Image.asset(
                  "images/placeholder.jpg",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 25),
            TextFormField(
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write the description of the game",
                labelText: "Description",
              ),
              readOnly: false,
              maxLines: 6,
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
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
                  onPressed: () {},
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

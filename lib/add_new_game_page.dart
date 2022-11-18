import 'package:flutter/material.dart';

class AddNewgame extends StatelessWidget {
  const AddNewgame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafa),
        shadowColor: Colors.transparent,
        toolbarHeight: 72,
        foregroundColor: Colors.black87,
        title: const Text(
          "Add new game",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

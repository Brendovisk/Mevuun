import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meevun_2/main.dart';
import 'package:meevun_2/pages/login/create_account.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  String? email;
  String? password;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  int requestCode = 0;

  String auxiliar = "";

  Future<String> createLoginState(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/v1/auth/signin/'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'email': email,
          'password': password,
        },
      );

      requestCode = response.statusCode;

      String parsedJson = jsonEncode(response.body);
      String token = parsedJson.substring(14, 202);

      auxiliar = token;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Logo",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                const Text(
                  "Login into Mevun",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text("New User?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CreateAccountPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Create an Account".toUpperCase(),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                TextFormField(
                  readOnly: false,
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email Address",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  readOnly: false,
                  controller: _controllerPassword,
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
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          Timer(
                            const Duration(seconds: 1),
                            () {
                              if (requestCode == 201) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context,
                                            {rootNavigator = false}) =>
                                        const AllGames(),
                                  ),
                                );
                              }
                            },
                          );
                          createLoginState(
                              _controllerEmail.text, _controllerPassword.text);
                        },
                      );
                    },
                    child: Text(
                      "Sign in".toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setToken() {}
}

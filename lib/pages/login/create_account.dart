import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isObscure = true;

  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<http.Response> createLoginState(
      String firstName, String lastName, String email, String senha) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/v1/auth/signup/'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'name': firstName,
        'lastname': lastName,
        'email': email,
        'password': senha,
      },
    );

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Return"),
      ),
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
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  "Create an account",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text("Type your full name, email and password"),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "First name",
                  ),
                  controller: _controllerFirstName,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Last name",
                  ),
                  controller: _controllerLastName,
                ),
                const SizedBox(height: 20),
                TextFormField(
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
                // const SizedBox(height: 20),
                // TextFormField(
                //   readOnly: false,
                //   obscureText: _isObscure,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: "Re-type Password",
                //   ),
                // ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          createLoginState(
                            _controllerFirstName.text,
                            _controllerLastName.text,
                            _controllerEmail.text,
                            _controllerPassword.text,
                          );
                        },
                      );
                    },
                    child: Text(
                      "Sign up".toUpperCase(),
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
}

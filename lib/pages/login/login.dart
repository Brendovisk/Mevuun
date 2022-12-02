import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meevun_2/pages/login/create_account.dart';
import '../Usuarios.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  Future<Usuario> fetchUsuario(String id) async {
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/V1/users/$id'));

    if (response.statusCode == 200) {
      var decodeUsuarios = json.decode(response.body);
      Map <String, dynamic> lista = decodeUsuarios;
      List<Usuario> listaUsuario = [];
      Usuario usuario;

      try {
        // lista.forEach((value) {
          // usuario = Usuario(value)
        // })
      } catch (e) {
        
      }


      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
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
                  readOnly: true,
                  initialValue: "John Doe",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email Address",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
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
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
}

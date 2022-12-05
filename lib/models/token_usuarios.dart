import 'package:flutter/material.dart';

class TokenUsuario with ChangeNotifier {
  String _token = "";

  get getToken => _token;

  void accessToken(token) {
    _token = token;
  }
}

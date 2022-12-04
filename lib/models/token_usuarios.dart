import 'package:flutter/material.dart';

class tokenUsuario with ChangeNotifier {
  String _token = "";

  get getToken => _token;

  void accessToken(token) {
    this._token = token;
  }
}

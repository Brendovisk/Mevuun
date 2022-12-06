import 'package:flutter/material.dart';

class UserView with ChangeNotifier {
  String _id = "";

  get id => _id;

  void setId(String id) {
    _id = id;
  }
}

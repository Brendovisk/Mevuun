import 'package:flutter/material.dart';

class GameView with ChangeNotifier {
  int _i = -1;

  get i => _i;

  void setI(int i) {
    _i = i;
  }

  void clearI() {
    _i = -1;
  }
}

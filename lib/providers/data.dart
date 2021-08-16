import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  int counter = 500;

  void updateCounter(int data) {
    counter += data;
    notifyListeners();
  }
}

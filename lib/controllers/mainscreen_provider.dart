import 'package:flutter/material.dart';

class GetDataProvider extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }

  // Add any additional methods or properties as needed
}

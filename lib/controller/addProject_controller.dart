import 'package:flutter/material.dart';

class AddprojectController with ChangeNotifier {
  int itemCount = 2;
  addProjectRole(int currentIndex) {
    //to ensure the count is incremented only when the last item in tapped
    if (itemCount == currentIndex + 1) {
      itemCount++;
    }
    notifyListeners();
  }

 
}

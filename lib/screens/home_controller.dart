import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedButtomTab = 0;

  void onButtomNavigationTabChange(int index) {
    selectedButtomTab = index;
    notifyListeners();
  }

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBonnetLock = true;
  bool isTrunkLock = true;

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updatLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updatBonnetLock() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void updatTrunkLock() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }

  bool isCoolSelected = true;

  void updateCoolselectedTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:tesla_car/models/temp_details_model.dart';

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

  TempDetailsModel demoTemp = demoTempDetails;

  void increaseTemp() {
    if (demoTemp.temp < 30) {
      demoTemp.temp++;
    }
    notifyListeners();
  }

  void decreaseTemp() {
    if (demoTemp.temp > 10) {
      demoTemp.temp--;
    }
    notifyListeners();
  }

  bool isShowTyre = false;

  void showTyreController(int index) {
    if (selectedButtomTab != 3 && index == 3) {
      Future.delayed(
        const Duration(milliseconds: 400),
        () {
          isShowTyre = true;
          notifyListeners();
        },
      );
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  bool isShowTyreStatus = false;

  void tyreStatuscontroller(int index) {
    if (selectedButtomTab != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(const Duration(milliseconds: 400), () {
        isShowTyreStatus = false;
        notifyListeners();
      });
    }
  }
}

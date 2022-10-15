import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isGrooming = false;
  bool _isReservingHotel = false;
  int _nightsNumber = 0;

  bool get isGrooming => _isGrooming;
  bool get isReservingHotel => _isReservingHotel;
  int get nightsNumber => _nightsNumber;

  set isGrooming(bool value) {
    if (value != _isGrooming) {
      _isGrooming = value;
      notifyListeners();
    }
  }

  set isReservingHotel(bool value) {
    if (value != _isReservingHotel) {
      _isReservingHotel = value;
      notifyListeners();
    }
  }

  set nightsNumber(int value) {
    if (value != _nightsNumber) {
      _nightsNumber = value;
      notifyListeners();
    }
  }

  static HomeViewModel of(BuildContext context) =>
      Provider.of<HomeViewModel>(context, listen: false);


  void changeGrooming() {
      isGrooming = !isGrooming;
  }

  void changeReservingHotel() {
      isReservingHotel = !isReservingHotel;
  }

  void increaseNights() {
      nightsNumber++;
  }

  void decreaseNights() {
    if(nightsNumber > 0) {
        nightsNumber--;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:pet_service/home_view_model.dart';
import 'package:provider/provider.dart';

class DogViewModel extends HomeViewModel {
  bool _isGrooming = false;
  bool _isReservingHotel = false;
  int _nightsNumber = 0;

  bool get isGrooming => _isGrooming;

  bool get isReservingHotel => _isReservingHotel;

  int get nightsNumber => _nightsNumber;

  set isGrooming(bool value) {
    print("I am Dog");

    print(_isGrooming);
    if (value != _isGrooming) {
      _isGrooming = value;
      notifyListeners();
    }
    print(_isGrooming);
  }

  set isReservingHotel(bool value) {
    print(_isReservingHotel);

    if (value != _isReservingHotel) {
      _isReservingHotel = value;
      notifyListeners();
    }
    print(_isReservingHotel);
  }

  set nightsNumber(int value) {
    print(_nightsNumber);

    if (value != _nightsNumber) {
      _nightsNumber = value;
      notifyListeners();
    }
    print(_nightsNumber);
  }

  static DogViewModel of(BuildContext context) =>
      Provider.of<DogViewModel>(context, listen: false);


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
    if (nightsNumber > 0) {
      nightsNumber--;
    }
  }
}
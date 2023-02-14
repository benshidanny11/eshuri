import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/Car.dart';
import '../utils/firabase_util.dart';


class CarsProvider extends ChangeNotifier {
  Future<String> uploadCarImage(File file) async {
    try {
      final res =
          await getStorageReference().child('images').child('cars').child(const Uuid().v4()).putFile(file);
      return res.ref.getDownloadURL();
    } catch (err) {
      return 'Error';
    }
  }

  Future<String> createCar(Car car) async {
    try {
      final res = await getCollectionReference('cars').add(car.toJson());
      return 'Success';
    } catch (err) {
      return 'Error';
    }
  }

   Future<List<Car>> getCars() async {
    final res = await getCollectionReference('cars').get();
    List<Car> cars = [];

    for (var car in res.docs) {
      cars.add(Car.fromJson(car));
    }
    return cars;
  }
}

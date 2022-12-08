import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cart {
  int id;
  String title;
  String price;
  String image;
  String description;
  String category;
  int quatity;
  double totalprice;
  Cart(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.category,
      required this.quatity,
      required this.totalprice});
}

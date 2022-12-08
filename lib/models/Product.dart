import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product {
  int id;
  String title;
  String price;
  String image;
  String description;
  String category;
  Map<String, dynamic> rating;
  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.category,
      required this.rating});
}

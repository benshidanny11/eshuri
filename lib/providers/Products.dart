import 'dart:convert';
import 'package:erangaapp/constants/apis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _items = [];
  List<Product> _productsForSearch = [];

  List<Product> get products {
    return [..._productsForSearch];
  }

  Future<void> fetchProducs() async {
    try {
      var response = await http.get(Uri.parse(PRODUCTS_API));
      final extractedData = json.decode(response.body) as List<dynamic>;
      extractedData.forEach((prod) {
        _items.add(Product(
            id: prod['id'],
            title: prod['title'],
            image: prod['image'],
            description: prod['description'],
            category: prod['category'],
            price: prod['price'].toString(),
            rating: prod['rating']));
      });
      _productsForSearch.addAll(_items);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  void searchProduct(String query) {
    _productsForSearch = [];
    _items.forEach((product) {
      if (product.title.toLowerCase().contains(query.toLowerCase()) ||
          product.description.toLowerCase().contains(query.toLowerCase())) {
        _productsForSearch.add(product);
      }
    });
    notifyListeners();
  }

  Product getProduct(int id) {
   return _items.firstWhere((product) => product.id == id);
  }
}

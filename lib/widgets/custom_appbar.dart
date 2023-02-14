import 'package:flutter/material.dart';

PreferredSizeWidget customAppbar(String title) {
  return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF010035)),
      ),
      bottomOpacity: 0.0,
      elevation: 0.0,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255));
}

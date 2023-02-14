import 'package:erangaapp/screens/Cars.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

List<Bubble> getItemsitems(_animationController, context) {
  return <Bubble>[
    // Floating action menu item
    Bubble(
      title: "Document",
      iconColor: Colors.white,
      bubbleColor: const Color(0xFF010035),
      icon: Icons.document_scanner,
      titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
      onPress: () {
        _animationController!.reverse();
      },
    ),
    // Floating action menu item
    Bubble(
      title: "Add car",
      iconColor: Colors.white,
      bubbleColor: const Color(0xFF010035),
      icon: Icons.car_rental_rounded,
      titleStyle: TextStyle(fontSize: 16, color: Colors.white),
      onPress: () {
        _animationController!.reverse();
        Navigator.pushNamed(context, Cars.id);
      },
    ),
    //Floating action menu item
    Bubble(
      title: "Add house",
      iconColor: Colors.white,
      bubbleColor: const Color(0xFF010035),
      icon: Icons.house,
      titleStyle: TextStyle(fontSize: 16, color: Colors.white),
      onPress: () {
        _animationController!.reverse();
      },
    ),
  ];
}

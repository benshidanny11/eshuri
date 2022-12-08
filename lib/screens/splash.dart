import 'package:erangaapp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, Home.id);
    });
    return Scaffold(
      body: Container(
        color: const Color(0xFF010035),
        child: Center(
            child: Image.asset(
          'assets/applogo.png',
          width: 220,
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeProduct extends StatelessWidget {
  const LikeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(17.5)),
      child: const Center(
        child: Icon(
          FontAwesomeIcons.heart,
          // background: rgba(255, 110, 78, 1);

          color: Color.fromRGBO(255, 110, 78, 1),
          size: 12,
        ),
      ),
    );
  }
}

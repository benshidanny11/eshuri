import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Car.dart';

class CarItem extends StatelessWidget {
  Car car;
  CarItem({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Container(
      child: Column(children: [
        Stack(
          children: [
            Image.network(
              car.image,
              height: 250,
              width:width * .95 ,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color:Color.fromARGB(114, 255, 110, 78),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    car.serviceType,
                    style: const TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(car.model), Text(car.price.toString())],
        ),
        Container(
          height: 10,
          color: const Color.fromARGB(255, 234, 234, 234),
        )
      ]),
    );
  }
}

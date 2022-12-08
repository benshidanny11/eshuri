import 'package:erangaapp/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Details extends StatelessWidget {
  final Product product;
  Details({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin:const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
       physics:const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Category:',
                  style: TextStyle(
                      color: Color.fromRGBO(1, 0, 53, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -0.333333),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product.category,
                  style:const TextStyle(
                      color: Color.fromARGB(202, 1, 0, 53),
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      letterSpacing: -0.333333),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                      color: Color.fromRGBO(1, 0, 53, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -0.333333),
                ),
                 const SizedBox(
                  height: 10,
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                      color: Color.fromARGB(202, 1, 0, 53),
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      letterSpacing: -0.333333),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Container(
              height: 45,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(255, 110, 78, 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Text(
                    'Add to cart',
                    style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: -0.333333),
                  ),
                  Text(
                    '\$ ${product.price}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: -0.333333),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

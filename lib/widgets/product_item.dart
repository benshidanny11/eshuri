import 'package:erangaapp/screens/productdetalis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Product.dart';
import 'like_product.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDatails.id,arguments: {'id':product.id});
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
                const Positioned(right: 2, top: 2, child: LikeProduct())
              ],
            ),
            const SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '\$ ${product.price}',
                  style: const TextStyle(
                    color: Color.fromRGBO(1, 0, 53, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  product.title,
                  style: const TextStyle(
                    color: Color.fromRGBO(1, 0, 53, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

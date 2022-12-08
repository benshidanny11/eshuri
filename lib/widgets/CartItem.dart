import 'package:erangaapp/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartItem extends StatefulWidget {
  Cart cart;
  Function(Cart cart, String changeType)? updateQuatity;
  CartItem({Key? key, required this.cart, this.updateQuatity})
      : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              widget.cart.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  child: Text(
                    widget.cart.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '\$ ${widget.cart.totalprice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 110, 78, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Container(
              height: 70,
              width: 26,
              decoration: BoxDecoration(
                  color: Color.fromARGB(202, 1, 0, 53),
                  borderRadius: BorderRadius.circular(26)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.updateQuatity!(widget.cart, 'ADD');
                        },
                        child:const Text(
                          "+",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        widget.cart.quatity.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      
                      GestureDetector(
                         onTap: () {
                          widget.updateQuatity!(widget.cart, 'REDUCE');
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ]),
              ),
            )
          ],
        ));
  }
}

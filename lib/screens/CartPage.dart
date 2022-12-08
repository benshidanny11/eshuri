import 'package:erangaapp/local_db/sql_helper.dart';
import 'package:erangaapp/widgets/CartItem.dart';
import 'package:erangaapp/widgets/CustomAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  _changeProductQuactity(Cart cart, String changeType) {
    if (changeType == "ADD") {
      cart.quatity = cart.quatity + 1;
      cart.totalprice = double.parse(cart.price) * cart.quatity;
      SQLHelper.updateItem(cart);
    } else {
      if (cart.quatity > 1) {
        cart.quatity = cart.quatity - 1;
        cart.totalprice = cart.totalprice - double.parse(cart.price);
        SQLHelper.updateItem(cart);
      }
    }
    setState(() {});
  }

  var _id = 0;

  _emptyCartAction(ctx) async {
    await SQLHelper.deleteAll();
    setState(() {});
    Navigator.of(ctx).pop();
  }

  _deleteOneCartAction(ctx) async {
    await SQLHelper.deleteItem(_id);
    setState(() {});
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My cart",
                style: TextStyle(
                  color: Color(0xFF010035),
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              IconButton(
                  onPressed: (() {
                    CustomAlertDialog(
                      title: "Empty cart",
                      content: "Are you sure you want to empty cart?",
                      onPositiveClick: _emptyCartAction,
                    ).show(context);
                  }),
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Color(0xFF010035),
                    size: 30,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 9, 8, 80),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder(
                  future: SQLHelper.getItems(),
                  builder: ((context, snapshot) {
                    if (snapshot.data != null) {
                      List<Cart> carts = snapshot.data as List<Cart>;
                      return ListView.builder(
                        itemBuilder: ((context, index) {
                          return Dismissible(
                            onDismissed: (_) {
                              _id = carts[index].id;
                              CustomAlertDialog(
                                      onNegativeClick: (ctx) {
                                        setState(() {});
                                        Navigator.of(ctx).pop();
                                      },
                                      onPositiveClick: _deleteOneCartAction,
                                      title: "Delete cart",
                                      content:
                                          "Are you sure you want to delete this cart?")
                                  .show(context);
                            },
                            key:  UniqueKey(),
                            background: Container(
                              color: Color.fromARGB(54, 88, 88, 88),
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            secondaryBackground: Container(
                              color: Color.fromARGB(54, 88, 88, 88),
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: CartItem(
                              cart: carts[index],
                              updateQuatity: _changeProductQuactity,
                            ),
                          );
                        }),
                        itemCount: carts.length,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      );
                    }
                  })),
            ),
          ),
        ),
      ],
    );
  }
}

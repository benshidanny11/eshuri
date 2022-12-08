import 'package:erangaapp/models/Cart.dart';
import 'package:erangaapp/providers/Products.dart';
import 'package:erangaapp/screens/home.dart';
import 'package:erangaapp/widgets/details.dart';
import 'package:erangaapp/widgets/features.dart';
import 'package:erangaapp/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../local_db/sql_helper.dart';

import '../widgets/shop.dart';

class ProductDatails extends StatefulWidget {
  static String id = '/productdetails';
  const ProductDatails({Key? key}) : super(key: key);

  @override
  State<ProductDatails> createState() => _ProductDatailsState();
}

class _ProductDatailsState extends State<ProductDatails> {
  var _cartSize = 0;

  Future<int> _getCartSize() async {
    List data = await SQLHelper.getItems();
    return data.length;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screnHeight = MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final product =
        Provider.of<ProductsProvider>(context).getProduct(args['id']);
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (() => Navigator.pop(context)),
                      child: Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(
                            color: Color(0xFF010035),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const Text(
                      'Product details',
                      style: TextStyle(
                          color: Color(0xFF010035),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    FutureBuilder(
                      future: _getCartSize(),
                      builder: (context, snapshot) {
                        return GestureDetector(
                          onTap: () async {
                            Cart cart = Cart(
                                id: product.id,
                                title: product.title,
                                description: product.description,
                                image: product.image,
                                price: product.price,
                                category: product.category,
                                quatity: 1,
                                totalprice: double.parse(product.price));

                            var inserted = await SQLHelper.createItem(cart);
                            print(inserted);
                            setState(() {});
                          },
                          child: Stack(children: [
                            Container(
                              height: 37,
                              width: 37,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 110, 78, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                FontAwesomeIcons.cartPlus,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            Positioned(
                              bottom: 2,
                              right: 3,
                              child: Text(
                                (snapshot.data != null)
                                    ? snapshot.data.toString()
                                    : '...',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ]),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(15),
                child: Image.network(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth,
                height: screnHeight * 0.55,
                decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                          color: Color(0xFF010035),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Rating(
                      rating: product.rating['rate'],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const TabBar(
                      labelColor: Color.fromRGBO(1, 0, 53, 1),
                      indicatorColor: Color.fromRGBO(255, 110, 78, 1),
                      labelPadding: EdgeInsets.all(0),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Mark Pro',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Mark Pro',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      tabs: [
                        Tab(
                          text: "Details",
                        ),
                        Tab(
                          text: "Shop",
                        ),
                        Tab(
                          text: "Features",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        // <-- Your TabBarView
                        children: [
                          Details(
                            product: product,
                          ),
                          Shop(),
                          Features(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

import 'package:erangaapp/providers/Cars.dart';
import 'package:erangaapp/screens/car_form.dart';
import 'package:erangaapp/widgets/CartItem.dart';
import 'package:erangaapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/Car.dart';
import '../widgets/car_item.dart';

class Cars extends StatefulWidget {
  static String id = '/car';
  const Cars({super.key});

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  Future? _carFuture;
  CarsProvider? _service;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = Provider.of(context,listen: false)<_CarsState>();
    _carFuture = _service!.getCars();
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: height * 80,
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
                                color: const Color(0xFF010035),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        const Text(
                          'Cars',
                          style: TextStyle(
                              color: Color(0xFF010035),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: (() => Navigator.pushNamed(context, CarForm.id)),
                          child: Container(
                            height: 37,
                            width: 37,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 110, 78, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              FontAwesomeIcons.carOn,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FutureBuilder(
                      future: _carFuture,
                      builder: (BuildContext context, AsyncSnapshot snapshoot) {
                        if (snapshoot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        List<Car> cars = [];
            
                        if (snapshoot.hasData) {
                          cars = snapshoot.data;
                        }
            
                        return ListView.builder(
                          itemBuilder: ((context, index) =>
                              CarItem(car: cars[index])),
                          itemCount: cars.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        );
                      })
                ],
              ),
            ),
          ),
        )),
    );
  }
}

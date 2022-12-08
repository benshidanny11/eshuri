import 'package:erangaapp/providers/Products.dart';
import 'package:erangaapp/screens/productdetalis.dart';
import 'package:provider/provider.dart';
import 'package:erangaapp/screens/home.dart';
import 'package:erangaapp/screens/splash.dart';
import 'package:flutter/material.dart';
import './local_db/sql_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider<ProductsProvider>(create: (_)=>ProductsProvider(),),
  ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Mark Pro'
        ),
        home: const Splash(),
        routes:{
          Home.id:(context) =>const Home(),
          ProductDatails.id:(context)=>const ProductDatails()
        },
      ),
    );
  }
}


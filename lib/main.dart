import 'package:erangaapp/providers/Cars.dart';
import 'package:erangaapp/providers/Products.dart';
import 'package:erangaapp/screens/Cars.dart';
import 'package:erangaapp/screens/car_form.dart';
import 'package:erangaapp/screens/productdetalis.dart';
import 'package:provider/provider.dart';
import 'package:erangaapp/screens/home.dart';
import 'package:erangaapp/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './local_db/sql_helper.dart';
import '../utils/color_util.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider<ProductsProvider>(create: (_)=>ProductsProvider(),),
    ChangeNotifierProvider<CarsProvider>(create: (_)=>CarsProvider(),)
  ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: color_swatch,
          fontFamily: 'Mark Pro'
        ),
        home: const Splash(),
        routes:{
          Home.id:(context) =>const Home(),
          ProductDatails.id:(context)=>const ProductDatails(),
          Cars.id:(context) => const Cars(),
          CarForm.id:(context) =>  CarForm()
        },
      ),
    );
  }
}


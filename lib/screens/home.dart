import 'package:erangaapp/screens/CartPage.dart';
import 'package:erangaapp/screens/products.dart';
import 'package:erangaapp/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  static String id = "/home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages = [Products(), CartPage()];
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "E-ranga app",
            style: TextStyle(color: const Color(0xFF010035)),
          ),
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(child: _pages[_index]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: const Color(0xFF010035),
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: const TextStyle(
                    color: Colors
                        .yellow))), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          currentIndex: _index,
          unselectedItemColor: Color.fromARGB(255, 217, 216, 216),
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.house_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shop_2), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken_sharp), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'My profile'),
          ],
        ),
      ),
    );
  }
}

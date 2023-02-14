import 'package:erangaapp/screens/CartPage.dart';
import 'package:erangaapp/screens/Profile.dart';
import 'package:erangaapp/screens/products.dart';
import 'package:erangaapp/widgets/custom_appbar.dart';
import 'package:erangaapp/widgets/search.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/fab_tems.dart';

class Home extends StatefulWidget {
  static String id = "/home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  final List<Widget> _pages = [const Products(), const CartPage(), const Profile()];
  var _index = 0;
   Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState(){
        
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController as Animation<double>);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();


  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('E-ranga'),
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
          unselectedItemColor: const Color.fromARGB(255, 217, 216, 216),
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.house_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shop_2), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'My profile'),
          ],
        ),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
           //Init Floating Action Bubble 
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: getItemsitems(_animationController, context),

        // animation controller
        animation: _animation as Animation,

        // On pressed change animation state
        onPress: () => _animationController!.isCompleted
              ? _animationController!.reverse()
              : _animationController!.forward(),
        
        // Floating Action button Icon color
        iconColor: Colors.white,

        // Flaoting Action button Icon 
        iconData: Icons.add, 
        backGroundColor: const Color(0xFF010035),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  Function(String) onChange;

  Search({Key? key,required this.onChange}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(children: [
        const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(
            Icons.search,
            color: Color.fromRGBO(255, 110, 78, 1),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.7,
          child: TextField(
            onChanged:widget.onChange,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "Search product"),
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
class CustomAlertDialog {

final Function onPositiveClick;
  final Function(BuildContext ctx)? onNegativeClick;
  final String title;
  final String content;
  const CustomAlertDialog(
      {Key? key,
      required this.onPositiveClick,
      this.onNegativeClick,
      required this.title,
      required this.content});


 show(BuildContext context) {
    return showDialog(context: context, builder: (ctx) {
      return AlertDialog(
      title: Text("Empty cart"),
      content: Text("Are you sure you want to empty cart?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (onNegativeClick != null) {
              onNegativeClick!(ctx);
            } else {
              Navigator.of(ctx).pop();
            }
          },
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            onPositiveClick(ctx);
          },
          child: Text("Yes"),
        ),
      ],
    );
    });
  }
}
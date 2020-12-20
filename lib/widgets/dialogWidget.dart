import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dialogBox(BuildContext context) {
  return CupertinoAlertDialog(
    title: Text(
      "Error",
      style: new TextStyle(color: Colors.red),
    ),
    content: Text("Please check your credentials"),
    actions: [
      CupertinoDialogAction(
        child: new Text("Close"),
        isDefaultAction: true,
        onPressed: () => Navigator.pop(context),
      )
    ],
  );
}

import 'package:flutter/material.dart';

  Widget customButton(BuildContext context,  String text, dynamic routeTo) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.3,
      height: 50,
      child: RaisedButton(
          child: new Text(
            text,
            style: new TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.lightBlueAccent,
          splashColor: Colors.lightBlue,
          elevation: 2.0,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => routeTo));
          }),
    );
  }
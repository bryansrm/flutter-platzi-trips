import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {

  final String title;

  TitleHeader({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double widthSreen = MediaQuery.of(context).size.width;

    return Container(
        width: widthSreen,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold
          ),
        ),
    );
  }
}
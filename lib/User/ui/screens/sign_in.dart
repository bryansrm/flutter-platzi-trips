import 'package:flutter/material.dart';

import 'package:design_app_pz/widgets/gradient_back.dart';
import 'package:design_app_pz/widgets/button_green.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(' Welcome \n This is your travel app',
                style: TextStyle(
                  fontSize: 38.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),  
              ),
              ButtonGreen(
                text: 'Login with Google',
                width: 300.0,
                height: 50.0,
                onPressed: (){}
              )
            ],
          )
        ],
      )
    );
  }

}
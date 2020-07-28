import 'package:design_app_pz/widgets/gradient_back.dart';
import 'package:flutter/material.dart';



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
            children: <Widget>[
              Text('Welcome \n This is your travel app',
                style: TextStyle(
                  fontSize: 38.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),  
              )
            ],
          )
        ],
      )
    );
  }

}
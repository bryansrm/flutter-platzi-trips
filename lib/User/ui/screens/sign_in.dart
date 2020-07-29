import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:design_app_pz/widgets/gradient_back.dart';
import 'package:design_app_pz/widgets/button_green.dart';
import 'package:design_app_pz/User/bloc/bloc_user.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
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
                onPressed: (){
                  userBloc.signIn()
                    .then((FirebaseUser result) => print("El usuario ingresado es ${result.displayName}"));
                }
              )
            ],
          )
        ],
      )
    );
  }

}
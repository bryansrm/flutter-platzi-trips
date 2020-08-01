
import 'dart:io';

import 'package:design_app_pz/Place/ui/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:design_app_pz/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    Color colorCircleButton = Color.fromRGBO(255, 255, 255, 0.6);

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            CircleButton(
              onPressed: null,
              mini: true, 
              icon: Icons.turned_in_not, 
              iconSize: 20.0, 
              color: colorCircleButton
            ),
            CircleButton(
              onPressed: null,
              mini: true, 
              icon: Icons.card_travel, 
              iconSize: 20.0, 
              color: colorCircleButton
            ),
            CircleButton(
              onPressed: (){
                File image;
                Navigator.push(context, 
                  MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: image,) ));
              },
              mini: false, 
              icon: Icons.add, 
              iconSize: 40.0, 
              color: Color.fromRGBO(255, 255, 255, 1)
            ),
            CircleButton(
              onPressed: null,
              mini: true, 
              icon: Icons.mail_outline, 
              iconSize: 20.0, 
              color: colorCircleButton
            ),
            CircleButton(
              onPressed: () => {
                userBloc.signIn()
              },
              mini: true, 
              icon: Icons.exit_to_app, 
              iconSize: 20.0, 
              color: colorCircleButton
            ),
            // CircleButton(true, Icons.card_travel, 20.0, Color.fromRGBO(255, 255, 255, 0.6)),
            // CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1)),
            // CircleButton(true, Icons.mail_outline, 20.0, Color.fromRGBO(255, 255, 255, 0.6)),
            // CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6))
          ],
        )
    );
  }

}
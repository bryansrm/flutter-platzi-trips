import 'dart:convert';

import 'package:design_app_pz/User/bloc/bloc_user.dart';
import 'package:design_app_pz/User/model/user.dart';
import 'package:flutter/material.dart';
import 'package:design_app_pz/User/ui/screens/profile_header.dart';
import 'package:design_app_pz/User/ui/widgets/profile_places_list.dart';
import 'package:design_app_pz/User/ui/widgets/profile_background.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
          default:
            return showProfileData(snapshot);
        }
      },
    );
  }
    

  Widget showProfileData(AsyncSnapshot snapshot){
    if(snapshot.hasData == null || snapshot.hasError){
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              // ProfileHeader(),
              // ProfilePlacesList()
              Text("Usuario no logueado")

            ],
          ),
        ],
      );
    }
    else{
      print('Logueado');
      //print(jsonEncode(jsonDecode(snapshot.data.toString())));
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        imgProfile: snapshot.data.photoUrl,

      );

      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user: user),
              ProfilePlacesList(user: user,)

            ],
          ),
        ],
      );
    }
  }

}
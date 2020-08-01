import 'package:flutter/material.dart';

import 'package:design_app_pz/Place/model/place.dart';

class User {

  final String uid;
  final String imgProfile;
  final String name;
  final String email;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;


  User({
    @required this.uid,
    @required this.imgProfile,
    @required this.name,
    @required this.email,
    this.myPlaces,
    this.myFavoritePlaces
  });

}
import 'package:design_app_pz/User/model/user.dart';
import 'package:flutter/cupertino.dart';

class Place {


  String name;
  String description;
  String urlImage;
  int likes;
  User userOwner;


  Place({
    @required this.name, 
    @required this.description, 
    @required this.urlImage, 
    this.likes,
    this.userOwner
  });
}
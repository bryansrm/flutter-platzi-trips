import 'package:design_app_pz/User/model/user.dart';
import 'package:flutter/cupertino.dart';

class Place {


  String name;
  String description;
  String uriImage;
  int likes;
  User userOwner;


  Place({
    @required this.name, 
    @required this.description, 
    @required this.uriImage, 
    this.likes,
    @required this.userOwner
  });
}
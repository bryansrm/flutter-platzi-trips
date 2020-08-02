import 'package:design_app_pz/Place/ui/widgets/card_image.dart';
import 'package:design_app_pz/Place/ui/widgets/location_input.dart';
import 'package:design_app_pz/widgets/text_input.dart';
import 'package:design_app_pz/widgets/title_header.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:design_app_pz/widgets/gradient_back.dart';


class AddPlaceScreen extends StatefulWidget {

  final File image;

  const AddPlaceScreen({Key key, this.image}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  final _controllerTitle = TextEditingController();
  final _controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300.0,),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon( Icons.keyboard_arrow_left, color: Colors.white, size: 45, )
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(top: 40.0, left: 20.0),
                  child: TitleHeader(title: 'Add new place',),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 80.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImage(
                    pathImage: "assets/img/beach_palm.jpeg",//widget.image.path,
                    iconData: Icons.camera_alt,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 250,
                    left: 0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: CustomTextInput(
                    controller: _controllerTitle, 
                    hintText: "Title",
                    inputType: null,),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: CustomTextInput(
                    controller: _controllerDescription, 
                    hintText: "Description",
                    inputType: TextInputType.multiline,
                    maxLines: 4,),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: LocationInput(
                    controller: _controllerDescription, 
                    hintText: "Location",
                    iconData: Icons.location_on,),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:design_app_pz/widgets/floating_action_button_green.dart';

class  CardImage extends StatelessWidget {

  final double height;
  final double width;
  final double left;
  // String pathImage = "assets/img/beach.jpeg";
  final String pathImage;
  final IconData iconData;
  final VoidCallback onPressedIcon;

  CardImage({
    Key key, 
    this.height = 350.0, 
    this.width = 250.0, 
    this.left = 20.0, 
    this.pathImage, 
    this.iconData, 
    this.onPressedIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(top: 80.0, left: left),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage(pathImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: onPressedIcon,
        )
      ],
    );
  }

}
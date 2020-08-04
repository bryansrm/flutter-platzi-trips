import 'package:flutter/material.dart';
import 'package:design_app_pz/Place/model/place.dart';
import 'package:design_app_pz/User/ui/widgets/profile_place_info.dart';
import 'package:design_app_pz/User/ui/widgets/profile_place.dart';

class ProfilePlace extends StatelessWidget {

  Place place;

  ProfilePlace(this.place); 

  @override
  Widget build(BuildContext context) {

    final photoCard = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 70.0
      ),
      height: 220.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(place.urlImage ?? "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80")
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
    );

    return Stack(
      alignment: Alignment(0.0, 0.8),
      children: <Widget>[
        photoCard,
        ProfilePlaceInfo(place)
      ],
    );
  }

}

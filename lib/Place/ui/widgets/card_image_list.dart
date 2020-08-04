import 'package:design_app_pz/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:design_app_pz/Place/ui/widgets/card_image.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CardImageList extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: userBloc.placesListStream,
        builder: (context, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
            default:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));
          }
        }
      )
      
      // ListView(
      //   padding: EdgeInsets.all(25.0),
      //   scrollDirection: Axis.horizontal,
      //   children: <Widget>[
      //     CardImage(pathImage: "assets/img/beach_palm.jpeg", iconData: Icons.favorite_border,),
      //     CardImage(pathImage: "assets/img/mountain.jpeg", iconData: Icons.favorite_border),
      //     CardImage(pathImage: "assets/img/mountain_stars.jpeg", iconData: Icons.favorite_border),
      //     CardImage(pathImage: "assets/img/river.jpeg", iconData: Icons.favorite_border),
      //     CardImage(pathImage: "assets/img/sunset.jpeg", iconData: Icons.favorite_border),
      //   ],
      // ),
    );

  }

  Widget listViewPlaces(List<CardImage> placesCard){
      return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: placesCard
      );
    }

}
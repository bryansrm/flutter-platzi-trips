import 'package:design_app_pz/User/bloc/bloc_user.dart';
import 'package:design_app_pz/User/model/user.dart';
import 'package:flutter/material.dart';
import 'package:design_app_pz/User/ui/widgets/user_info.dart';
import 'package:design_app_pz/User/ui/widgets/button_bar.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileHeader extends StatelessWidget {

  final User user;
  UserBloc userBloc;

  ProfileHeader({Key key, this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // userBloc = BlocProvider.of<UserBloc>(context);

    // return StreamBuilder(
    //   stream: userBloc.streamFirebase,
    //   builder: (BuildContext context, AsyncSnapshot snapshot){
    //     switch( snapshot.connectionState ){
    //       case ConnectionState.waiting:
    //         return CircularProgressIndicator();
    //       case ConnectionState.none:
    //         return CircularProgressIndicator();
    //       case ConnectionState.active:
    //         return showProfileData(snapshot);
    //       case ConnectionState.done:
    //         return null;
    //       default:
    //         return CircularProgressIndicator();
    //     }
    //   },
    // );

    final title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0
      ),
    );

    return Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              title
            ],
          ),
          UserInfo(user: user),
          ButtonsBar()
        ],
      ),
    );

  }

  // Widget showProfileData(AsyncSnapshot snapshot){
  //   if( !snapshot.hasData || snapshot.hasError ){
  //     print('no login');
  //     return Container(
  //       margin: EdgeInsets.only(
  //           left: 20.0,
  //           right: 20.0,
  //           top: 50.0
  //       ),
  //       child: Column(
  //         children: <Widget>[
  //           CircularProgressIndicator(),
  //           Text('No se pudo cargar la información')
  //         ],
  //       ),
  //     );
  //   }
  //   else{
  //     print('login');
  //     user = User(
  //       imgProfile: snapshot.data.photoUrl,
  //       name: snapshot.data.displayName, 
  //       email: snapshot.data.email,
  //     );

  //     final title = Text(
  //       'Profile',
  //       style: TextStyle(
  //           fontFamily: 'Lato',
  //           color: Colors.white,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 30.0
  //       ),
  //     );

  //     return Container(
  //       margin: EdgeInsets.only(
  //           left: 20.0,
  //           right: 20.0,
  //           top: 50.0
  //       ),
  //       child: Column(
  //         children: <Widget>[
  //           Row(
  //             children: <Widget>[
  //               title
  //             ],
  //           ),
  //           UserInfo(user: user,),
  //           ButtonsBar()
  //         ],
  //       ),
  //     );
  //   }
  // }


}
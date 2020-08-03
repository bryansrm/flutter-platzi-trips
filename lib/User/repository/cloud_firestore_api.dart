import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_app_pz/Place/model/place.dart';
import 'package:design_app_pz/User/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  void updateUserData( User user ) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'imgProfile': user.imgProfile,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now(),
    }, merge: true);
  }

  Future<void> updatePlaceData( Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    await _auth.currentUser().then((userLogin) {
      DocumentReference _userRef = _db.collection(this.USERS).document(userLogin.uid);
      refPlaces.add({
        'name': place.name,
        'description': place.description,
        'likes': place.likes,
        //'userOwner': "$USERS/${userLogin.uid}"
        'userOwner': _userRef ,
        'urlImage': place.urlImage
      }).then((place){
        DocumentReference refUsers = _db.collection(USERS).document(userLogin.uid);
        refUsers.updateData({
          'myPlaces': FieldValue.arrayUnion([ place ])
        });
        // place.get().then((snapshot){
        //   //snapshot.documentID;
        //   DocumentReference refUsers = _db.collection(USERS).document(userLogin.uid);
        //   refUsers.updateData({
        //     'myPlaces': FieldValue.arrayUnion([ place ])
        //   });
        // });
      });
    });
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_app_pz/Place/model/place.dart';
import 'package:design_app_pz/User/model/user.dart';
import 'package:design_app_pz/User/ui/widgets/profile_place.dart';
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
      });
    });
  }

  List<ProfilePlace> buildPlaces( List<DocumentSnapshot> placesListSnapshot ){
    
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    placesListSnapshot.forEach((place) {
      profilePlaces.add( ProfilePlace(
        Place(
          name: place.data['name'], 
          description: place.data['description'], 
          urlImage: place.data['urlImage'],
          likes: place.data['likes']
        )
      ) );

      
    });

    return profilePlaces;

  }

}
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:design_app_pz/Place/model/place.dart';
import 'package:design_app_pz/Place/ui/widgets/card_image.dart';
import 'package:design_app_pz/User/model/user.dart';
import 'package:design_app_pz/User/repository/cloud_firestore_api.dart';
import 'package:design_app_pz/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData( Place place) => _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);
  List<CardImage> buildPlaces( List<DocumentSnapshot> placesListSnapshot ) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);

}
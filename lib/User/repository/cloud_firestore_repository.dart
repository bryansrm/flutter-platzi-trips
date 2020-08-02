
import 'package:design_app_pz/Place/model/place.dart';
import 'package:design_app_pz/User/model/user.dart';
import 'package:design_app_pz/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData( Place place) => _cloudFirestoreAPI.updatePlaceData(place);
}
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_app_pz/Place/model/place.dart';
import 'package:design_app_pz/Place/repository/firebase_storage_repository.dart';
import 'package:design_app_pz/Place/ui/widgets/card_image.dart';
import 'package:design_app_pz/User/repository/cloud_firestore_api.dart';
import 'package:design_app_pz/User/ui/widgets/profile_place.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:design_app_pz/User/model/user.dart';
import 'package:design_app_pz/User/repository/cloud_firestore_repository.dart';
import 'package:design_app_pz/User/repository/auth_repository.dart';

class UserBloc implements Bloc{

  final _authRepository = AuthRepository();

  // Flujo de datos - Stream
  // Stream - Firebase
  // StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  // Casos de uso
  // 1. SignIn a la aplicacion Google
  Future<FirebaseUser> signIn(){
    return _authRepository.signInFirebase();
  }

  // 2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  // 3. Registrar place en base de datos
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);
  Stream<QuerySnapshot> placesListStream = Firestore.instance.collection( CloudFirestoreAPI().PLACES ).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;
  List<CardImage> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);  
  Stream<QuerySnapshot> myPlacesListStream(String uid) => 
    Firestore.instance.collection(CloudFirestoreAPI().PLACES)
    .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/$uid"))
    .snapshots();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);  

  final _firebaseStorageRepository = FirebaseStorageRepository();

  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);


   signOut(){
    return _authRepository.signOut();
  }


  @override
  void dispose() { 
    
    //super.dispose();
  }
}
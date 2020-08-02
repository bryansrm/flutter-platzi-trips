import 'dart:async';
import 'package:design_app_pz/Place/model/place.dart';
import 'package:firebase_auth/firebase_auth.dart';
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


   signOut(){
    return _authRepository.signOut();
  }


  @override
  void dispose() { 
    
    //super.dispose();
  }
}
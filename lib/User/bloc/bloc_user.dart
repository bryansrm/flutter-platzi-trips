import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:design_app_pz/User/repository/auth_repository.dart';

class UserBloc implements Bloc{

  final _authRepository = AuthRepository();

  // Casos de uso
  // 1. SignIn a la aplicacion Google
  Future<FirebaseUser> signIn(){
    return _authRepository.signInFirebase();
  }


  @override
  void dispose() { 
    
    //super.dispose();
  }
}
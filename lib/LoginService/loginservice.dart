// ignore_for_file: file_names

import 'package:dictionaryappwith_bloc/LoginService/login_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthentication {
  static final auth = FirebaseAuth.instance;
  AuthStatus status = AuthStatus.emailAlreadyExists;
  Future<AuthStatus> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
       await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      auth.currentUser!.updateDisplayName(name);
      status = AuthStatus.successful;
      print(status);
    } on FirebaseAuthException catch (e) {
      status = AuthExceptionHandler.handleAuthException(e);
      print(status);
    }
    return status;
  }

  Future<AuthStatus> login({
    required String email,
    required String password,
  }) async {
    try {
       await auth.signInWithEmailAndPassword(
          email: email, password: password);
      status = AuthStatus.successful;
      print(status);
    } on FirebaseAuthException catch (e) {
      status = AuthExceptionHandler.handleAuthException(e);
      print(status);
    }
    return status;
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthWebService {
  Future<UserCredential> signUpWithEmailPass({
    required String email,
    required String password,
    required String userName,
  });
  Future<void> signInWithEmailPass({
    required String email,
    required String password,
  });
}

class AuthWebServiceImpl implements AuthWebService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> signUpWithEmailPass({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      throw ">>>> Error When CreateAccount: $e";
    }
  }
  @override
  Future<void> signInWithEmailPass({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw ">>>> Error When Login With Email , Pass $e";
    }
  }
}

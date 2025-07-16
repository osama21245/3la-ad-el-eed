import 'package:cloud_firestore/cloud_firestore.dart';
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
  CollectionReference userCollection = FirebaseFirestore.instance.collection(
    "users",
  );
  @override
  Future<UserCredential> signUpWithEmailPass({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      // create account with emailPassword Firebase Auth
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // adding user Data to users collection Firebase FireStore
      await userCollection.add({
        "user_id": userCredential.user!.uid,
        "is_seller": 0,
        "is_send_shop_request": 0,
        "user_name": userName,
        "email": email,
        "password": password,
      });
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
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw ">>>> Error When Login With Email , Pass $e";
    }
  }
}

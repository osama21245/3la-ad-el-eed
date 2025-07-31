import 'package:_3la_ad_el_eed/core/connection/check_internet_connection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthWebService {
  Future<bool> isInternetConnected();
  Future<UserCredential> signUpWithEmailPass({
    required String email,
    required String password,
  });
  Future<void> signInWithEmailPass({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>?> getCurrentUserData({required String email});
}

class AuthWebServiceImpl implements AuthWebService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userCollection = FirebaseFirestore.instance.collection(
    "users",
  );
  CheckInternetConnection checkInternet = CheckInternetConnection();
  @override
  Future<UserCredential> signUpWithEmailPass({
    required String email,
    required String password,
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

  @override
  Future<Map<String, dynamic>?> getCurrentUserData({
    required String email,
  }) async {
    try {
      // Fetch user data from Firestore based on email
      return userCollection.where("email", isEqualTo: email).get().then((
        snapshot,
      ) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.first.data() as Map<String, dynamic>;
        }
        return null;
      });
    } catch (e) {
      throw ">>> Error When Fetching User Data: $e";
    }
  }

  @override
  Future<bool> isInternetConnected()async {
  return await checkInternet.checkConnection();
  }
}

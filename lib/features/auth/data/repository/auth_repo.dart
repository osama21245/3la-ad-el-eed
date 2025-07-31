import 'package:_3la_ad_el_eed/features/auth/data/models/user_model.dart';
import 'package:_3la_ad_el_eed/features/auth/data/web_service/auth_web_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  AuthWebService authWebService = AuthWebServiceImpl();

  @override
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await authWebService.signInWithEmailPass(
        email: email,
        password: password,
      );
    } catch (e) {
      throw ">>>- Error When Login $e";
    }
  }

  @override
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await authWebService.signUpWithEmailPass(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw ">>> Error When CreateAccount $e";
    }
  }

  @override
  Future<UserModel> getCurrentUserData(String email) async {
    Map<String, dynamic>? user = await authWebService.getCurrentUserData(
      email: FirebaseAuth.instance.currentUser!.email!,
    );
    if (user != null) {
      return UserModel.fromJson(user);
    } else {
      throw "User data not found";
    }
  }

  // auth methods will needed
  @override
  Future emailVerify(user) async {}

  @override
  Future deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> isInternetConnected() async{
  return await  authWebService.isInternetConnected();
  }
}

abstract class AuthRepo {
  //checking internet connection
  Future<bool> isInternetConnected();
  // method used in auth for login
  Future<void> loginWithEmail({
    required String email,
    required String password,
  });
  // method used in auth for create new user account firebase
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  });
  // auth methods will needed
  Future emailVerify(User user);
  Future<void> forgetPassword({required String email});
  Future<UserModel> getCurrentUserData(String email);
  Future<void> signOut();
  Future deleteUser();
}

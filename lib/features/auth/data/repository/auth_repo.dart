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
    required String userName,
  }) async {
    try {
      UserCredential userCredential = await authWebService.signUpWithEmailPass(
        email: email,
        password: password,
        userName: userName,
      );
      return userCredential;
    } catch (e) {
      throw ">>> Error When CreateAccount $e";
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
  Future<Map<String, dynamic>?> getCurrentUserData(String email) {
    // TODO: implement getCurrentUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

abstract class AuthRepo {
  // method used in auth for login
  Future<void> loginWithEmail({
    required String email,
    required String password,
  });
  // method used in auth for create new user account firebase
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
    required String userName,
  });
  // auth methods will needed
  Future emailVerify(User user);
  Future<void> forgetPassword({required String email});
  Future<Map<String, dynamic>?> getCurrentUserData(String email);
  Future<void> signOut();
  Future deleteUser();
}

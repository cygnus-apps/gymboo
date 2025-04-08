import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gymboo_admin/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:gymboo_admin/utils/exceptions/firebase_exceptions.dart';
import 'package:gymboo_admin/utils/exceptions/format_exceptions.dart';
import 'package:gymboo_admin/utils/exceptions/platform_exceptions.dart' show gbPlatformException;
import 'package:gymboo_admin/utils/routes/routes.dart';

class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find();

  //Firebase Auth Instance
 final _auth = FirebaseAuth.instance;


  //Get Auntenticated user data
  User? get authUser => _auth.currentUser;

  //Get Is Authenticated User
   bool get isAuthenticated => _auth.currentUser != null;

   @override void onReady() {
    // TODO: implement onReady
     _auth.setPersistence(Persistence.LOCAL);
  }

  //Funcion para determinar
  void screenRedirect() async {
     final user = _auth.currentUser;

     //si el usuario esta logueado
    if(user != null){
      //redirecciona a home
      Get.offAllNamed(gbRoutes.searchboard);
    }else{
      Get.offAllNamed(gbRoutes.login);
    }
  }

//Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      // Aquí iría el código para iniciar sesión con Firebase Authentication

      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw gbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw gbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const gbFormatException();
    } on PlatformException catch (e) {
      throw gbPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //GOOGLE AUTHENTICATION
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      if (userAccount == null) {
        // El usuario canceló el inicio de sesión
        throw 'Google Sign-In was cancelled by the user.';
      }

      final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        // Falló la obtención de los tokens de Google
        throw 'Failed to obtain Google authentication tokens.';
      }

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );

      return await FirebaseAuth.instance.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Firebase Authentication error occurred.';
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw e.message ?? 'Platform error during Google Sign-In.';
    } catch (e) {
      if (kDebugMode) {
        print('Something went wrong: $e');
      }
      throw 'Something went wrong. Please try again.';
    }
  }

  //Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      // Aquí iría el código para iniciar sesión con Firebase Authentication
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw gbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw gbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const gbFormatException();
    } on PlatformException catch (e) {
      throw gbPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Register user by Admin

  //Email Verification
  Future<void> sendEmailVerification() async{

    try {
      // Aquí iría el código para iniciar el envio de verificacion con email
        await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      
      throw gbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw gbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const gbFormatException();
    } on PlatformException catch (e) {
      throw gbPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Forget Password

  //Re Authenticate user

  //Logout User
  Future<void> Logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(gbRoutes.login);
    } on FirebaseAuthException catch (e) {
      throw gbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw gbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const gbFormatException();
    } on PlatformException catch (e) {
      throw gbPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  //Delete User
}
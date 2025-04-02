import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/data/repositories/authentication/authentication_repository.dart';
import 'package:gymboo_admin/features/authentication/models/user_model.dart';
import 'package:gymboo_admin/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:gymboo_admin/utils/exceptions/firebase_exceptions.dart';
import 'package:gymboo_admin/utils/exceptions/format_exceptions.dart';
import 'package:gymboo_admin/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  //Firebase Auth Instance
  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
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

  Future<UserModel> fetchAdminDetails() async {
    try {
      final docSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).get();
      return UserModel.fromSnapshot(docSnapshot);
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
}
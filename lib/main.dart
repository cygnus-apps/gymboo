import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymboo_admin/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gymboo_admin/data/repositories/authentication/authentication_repository.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

Future<void> main() async {

  //le quita el # a las urls
  setPathUrlStrategy();

  //Inicializa el local storage Get X
  await GetStorage.init();


  //Inicializa la base de datoa
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,)
      .then((Value)=> Get.put(AuthenticationRepository())) ;
  runApp(const App());
}


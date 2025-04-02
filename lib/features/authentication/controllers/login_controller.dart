import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymboo_admin/data/repositories/authentication/authentication_repository.dart';
import 'package:gymboo_admin/data/repositories/user/user_repository.dart';
import 'package:gymboo_admin/features/authentication/controllers/user_controller.dart';
import 'package:gymboo_admin/features/authentication/models/user_model.dart';
import 'package:gymboo_admin/utils/constants/enums.dart';
import 'package:gymboo_admin/utils/constants/image_strings.dart';
import 'package:gymboo_admin/utils/helpers/network_manager.dart';
import 'package:gymboo_admin/utils/popups/full_screen_loader.dart';
import 'package:gymboo_admin/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStore = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStore.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStore.read('REMEMBER_ME_PASSWORD') ?? '';

    super.onInit();
  }

  //Handles email and password sigin in process
  Future<void> emailPasswordSigIn() async {
    try {
      //Empezar a cargar
      gbFullScreenLoader.openLoadingDialog(
          'Iniciando Sesión...', gbImages.docerAnimation);

      //check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        gbFullScreenLoader.stopLoading();
        return;
      }
      //valida formulario
      if (!loginFormKey.currentState!.validate()) {
        gbFullScreenLoader.stopLoading();
        return;
      }
      //Guarda la info si rememberme esta seleccionado
      if (rememberMe.value) {
        localStore.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStore.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //Login user
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //fetch user detail and assign to userController

      final user = await UserController.instance.fetchUserDetail();

      //detengo el loader
      gbFullScreenLoader.stopLoading();

      //Registro de usuario usando email y password
      //await AuthenticationRepository.instance.registerWithEmailAndPassword(email as String, password as String);

       //crea el registro de ADM en la Firestore
       //final userRepository = Get.put(UserRepository());
       //await userRepository.createUser(UserModel(
       //   id: AuthenticationRepository.instance.authUser!.uid,
       //   email: email as String,
       //   role: AppRole.admin));
       if(user.role!=   AppRole.admin){
         await AuthenticationRepository.instance.Logout();
         gbLoaders.errorSnackBar(title: 'emailPasswordSigIn - No Autorizado!', message: 'No tiene permiso para acceder, contacte con el Administrador.');
       }else{
         AuthenticationRepository.instance.screenRedirect();
       }

    } catch (e) {
      gbFullScreenLoader.stopLoading();
      gbLoaders.errorSnackBar(title: 'emailPasswordSigIn - Ups', message: e.toString());
    }
  }

  //Handles registration of admin user
  Future<void> registerAdmin() async {
    try {
      //Empezar a cargar
      gbFullScreenLoader.openLoadingDialog(
          'Registrando cuenta de Administrador...', gbImages.docerAnimation);

      //check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        gbFullScreenLoader.stopLoading();
        return;
      }
      //Registro de usuario usando email y password
      await AuthenticationRepository.instance.registerWithEmailAndPassword(email.value.text  , password.value.text  );

      //crea el registro de ADM en la Firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(UserModel(
          id: AuthenticationRepository.instance.authUser!.uid,
          email: email.value.text,
          role: AppRole.admin));

      //quito el loader
      gbFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      gbFullScreenLoader.stopLoading();
      gbLoaders.errorSnackBar(title: 'registerAdmin - Ups', message: e.toString());
    }
  }
}

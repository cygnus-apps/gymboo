import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/data/repositories/user/user_repository.dart';
import 'package:gymboo_admin/features/personalization/models/user_model.dart';
import 'package:gymboo_admin/utils/constants/enums.dart';
import 'package:gymboo_admin/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());


  Future<UserModel> fetchUserDetail() async {
    try {
      var user = await UserRepository.instance.fetchAdminDetails();
      return user;
    } catch (e) {
      gbLoaders.errorSnackBar(
          title: 'fetchUserDetail - Algo Salió mal!', message: e.toString());
      return UserModel.empty();
    }
  }

  Future<void> saveUserRecord(UserCredential userCredentials) async {
    try {
      //convierte el nombre en primer nombre y apellidos
      final nameParts =
          UserModel.nameParts(userCredentials.user!.displayName ?? '');
      final userName =
          UserModel.generateUsername(userCredentials.user!.displayName ?? '');

      //Map data
      final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName:
              nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ',
          username: userName,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
          role: AppRole.admin);

     await userRepository.saveUserRecord(user);
        } catch (e) {
      gbLoaders.errorSnackBar(title: 'No guardo!', message: e.toString());
    }
  }
  @override
  void onClose() {
    super.onClose();
    // Limpieza de recursos del UserController (ej., cerrar streams)
    print('UserController cerrado');
  }


}

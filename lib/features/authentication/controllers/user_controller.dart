import 'package:get/get.dart';
import 'package:gymboo_admin/data/repositories/user/user_repository.dart';
import 'package:gymboo_admin/features/authentication/models/user_model.dart';
import 'package:gymboo_admin/utils/popups/loaders.dart';

class UserController extends GetxController {
  // Singleton pattern with GetX
  static UserController get instance {
    if (!Get.isRegistered<UserController>()) {
      Get.put(UserController());
    }
    return Get.find<UserController>();
  }

  // Lazy initialization of UserRepository
  final userRepository = Get.lazyPut(() => UserRepository());

  // Uncomment and modify these if you need observable variables
  /*
  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  */

  Future<UserModel> fetchUserDetail() async {
    try {
      var user = await UserRepository.instance.fetchAdminDetails();
      return user;
    } catch (e) {
      gbLoaders.errorSnackBar(
          title: 'fetchUserDetail - Algo Salió mal!',
          message: e.toString()
      );
      return UserModel.empty();
    }
  }
}
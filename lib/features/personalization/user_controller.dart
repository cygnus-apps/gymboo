import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/data/repositories/user/user_repository.dart';
import 'package:gymboo_admin/features/authentication/models/user_model.dart';
import 'package:gymboo_admin/utils/constants/enums.dart';
import 'package:gymboo_admin/utils/constants/text_strings.dart';
import 'package:gymboo_admin/utils/popups/loaders.dart';

class UserController extends GetxController{
static UserController get instance => Get.find();

final userRepository = Get.put(UserRepository);

Future <void> saveUserRecord(UserCredential userCredentials) async{
  try{
    if(userCredentials != null){
      //convierte el nombre en primer nombre y apellidos
      final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
      final userName = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

      //Map data
      final user = UserModel(
        id:  userCredentials.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' '):' ',
        username: userName,
        email: userCredentials.user!.email ?? '',
        phoneNumber: userCredentials.user!.phoneNumber ?? '',
        profilePicture: userCredentials.user!.photoURL ?? '',
        role: AppRole.admin

      );

      userRepository.createUser(user);


    }else{

    }

  }catch(e)

    gbLoaders.errorSnackBar(title: 'No guardo!',message: e.toString());
  }
}
}
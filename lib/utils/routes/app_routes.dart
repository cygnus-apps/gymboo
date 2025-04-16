import 'package:get/get.dart';
import 'package:gymboo_admin/features/authentication/screen_forget_password/forget_password.dart';
import 'package:gymboo_admin/features/authentication/screen_reset_password/reset_password.dart';
import 'package:gymboo_admin/features/authentication/screens_login/login.dart';
import 'package:gymboo_admin/features/personalization/screens/user_detail.dart';
import 'package:gymboo_admin/features/searchboards/screens_searchboards/searchboard.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';
import 'package:gymboo_admin/utils/routes/routes_middleware.dart';

import '../../features/personalization/models/user_model.dart';


class gbAppRoutes {
  static final List<GetPage> pages = <GetPage>[
    GetPage(name: gbRoutes.login, page: () => const LoginScreen()),
    GetPage(name: gbRoutes.forgetPassword,page: () => const ForgetPasswordScreen()),
    GetPage(name: gbRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: gbRoutes.searchboard, page: () => const Searchboardcreen(),middlewares: [ gbRoutesMiddleware() ]),
    //GetPage(name: gbRoutes.userDetail, page: () => const gbUserDetailScreen(userModel: null,)),
    // En tu archivo routes.dart
    GetPage(
      name: gbRoutes.userDetail,
      page: () => const gbUserDetailScreen(),
      transition: Transition.fadeIn,
    )
    /*GetPage(
      name: gbRoutes.userDetail,
      page: () {
        UserModel userModel = Get.arguments['userModel'];
        return gbUserDetailScreen(userModel: userModel);
      },
    ),*/

  ];
}

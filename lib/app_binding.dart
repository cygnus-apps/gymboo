import 'package:get/get.dart';
import 'package:gymboo_admin/features/personalization/controllers/user_controller.dart';
import 'package:gymboo_admin/features/searchboards/controllers/search_board_controller.dart';
/*
class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(SearchBoardController());

  }
}*/
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Usar Get.lazyPut para inicializar controladores solo cuando se necesiten
    Get.lazyPut<UserController>(
          () => UserController(),
      fenix: true,
    );
    Get.lazyPut<SearchBoardController>(
          () => SearchBoardController(),
      fenix: true,
    );
  }
}
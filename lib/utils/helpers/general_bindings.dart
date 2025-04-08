
import 'package:get/get.dart';
import 'package:gymboo_admin/features/personalization/controllers/user_controller.dart';
import 'package:gymboo_admin/features/searchboards/controllers/search_board_controller.dart';
import 'package:gymboo_admin/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(()=> NetworkManager(), fenix: true);
    Get.put(UserController());
    Get.put(SearchBoardController());

  }


}
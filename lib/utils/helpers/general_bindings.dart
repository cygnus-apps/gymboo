
import 'package:get/get.dart';
import 'package:gymboo_admin/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(()=> NetworkManager(), fenix: true);
    //Get.lazyPut(()=> UserController(), fenix: true);
  }


}
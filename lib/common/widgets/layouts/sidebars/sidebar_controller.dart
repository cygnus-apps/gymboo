import 'package:get/get.dart';
import 'package:gymboo_admin/utils/device/device_utility.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';

class gbSidebarController extends GetxController {
  final activeItem = gbRoutes.login.obs;
  final hoverItem = ''.obs;

  void changeActiveItem(String route) => activeItem.value = route;
  void changeHoverItem(String route) {
    if (!isActive(route)) hoverItem.value = route;
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => activeItem.value == route;

  void menuOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);
      if(gbDeviceUtils.isMobileScreen(Get.context!)) Get.back();
      
      Get.toNamed(route);

    }
  }
}

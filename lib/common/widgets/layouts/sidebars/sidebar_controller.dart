import 'package:get/get.dart';
import 'package:gymboo_admin/features/searchboards/controllers/search_board_controller.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';

class gbSidebarController extends GetxController {
  final activeItem = gbRoutes.login.obs;
  final hoverItem = ''.obs;

  SearchBoardController get searchController =>
      Get.find<SearchBoardController>();

  void changeActiveItem(String item) => activeItem.value = item;
  void changeHoverItem(String item) {
    if (!isActive(item)) hoverItem.value = item;
  }

  bool isActive(String item) => activeItem.value == item;
  bool isHovering(String item) => activeItem.value == item;

  void menuOnTap(String item) {
    changeActiveItem(item);
    //if(gbDeviceUtils.isMobileScreen(Get.context!)) Get.back();
    searchController.filterByCategory(item);
    //Get.toNamed(item);
  }
}

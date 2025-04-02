import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';

class gbRouteObserver extends GetObserver{


  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
   final sidebarController = Get.put(gbSidebarController());

    if (previousRoute != null) {
      // Check the route name and update the active item in the sidebar accordingly
      for (var routeName in gbRoutes.sidebarMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }



  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
   /* final sidebarController = Get.put(SidebarController());

    if (route != null) {
      // Check the route name and update the active item in the sidebar accordingly
      for (var routeName in gbRoutes.sideMenuItems) {
        if (route.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }*/
  }


}
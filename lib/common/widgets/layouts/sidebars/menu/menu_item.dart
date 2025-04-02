import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:gymboo_admin/utils/constants/colors.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';

class gbMenuItem extends StatelessWidget {
  const gbMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
    required this.colori,
  });

  final String route;
  final IconData icon;
  final String itemName;
  final Color colori;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(gbSidebarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovering) => hovering
          ? menuController.changeHoverItem(route)
          : menuController.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: gbSizes.xs),
          child: Container(
            decoration: BoxDecoration(
                color: menuController.isHovering(route) || menuController.isActive(route) ?  colori : Colors.transparent ,
                 borderRadius: BorderRadius.circular(gbSizes.cardRadiusLg),
                 border: Border.all(color: gbColors.darkGrey),
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Icons
                Padding(
                  padding: const EdgeInsets.only(
                      left: gbSizes.lg,
                      top: gbSizes.md,
                      right: gbSizes.md,
                      bottom: gbSizes.md),
                   child: menuController.isActive(route)
                       ? Icon(icon,size: 22, color: gbColors.white)
                       : Icon(icon, size: 22,  color: menuController.isHovering(route)?  gbColors.white: gbColors.grey)

                ),
                if (menuController.isHovering(route) || menuController.isActive(route))
                  Flexible( child: Text(itemName, style: Theme.of(context).textTheme.bodyMedium!.apply(color: gbColors.white)))
                else
                  Flexible( child: Text(itemName, style: Theme.of(context).textTheme.bodyMedium!.apply(color: gbColors.darkGrey)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

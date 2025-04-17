import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/common/widgets/images/t_rounded_image.dart';
import 'package:gymboo_admin/features/personalization/controllers/user_controller.dart';
import 'package:gymboo_admin/features/searchboards/controllers/search_board_controller.dart';
import 'package:gymboo_admin/utils/constants/colors.dart';
import 'package:gymboo_admin/utils/constants/enums.dart';
import 'package:gymboo_admin/utils/constants/image_strings.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';
import 'package:gymboo_admin/utils/device/device_utility.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';
import 'package:iconsax/iconsax.dart';

class gbHeader extends StatelessWidget implements PreferredSize {
  gbHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;
  final SearchBoardController searchController =
      Get.find<SearchBoardController>();

  @override
  Widget build(BuildContext context) {
    // Obtener la instancia del UserController
    final UserController userController = Get.find<UserController>();

    // Verificar si estamos en la página searchboard
    bool isOnSearchBoard = Get.currentRoute.contains('searchboard');

    return Container(
      decoration: const BoxDecoration(
          color: gbColors.white,
          border:
              Border(bottom: BorderSide(color: gbColors.lightGrey, width: 1))),
      padding: const EdgeInsets.symmetric(
          horizontal: gbSizes.md, vertical: gbSizes.sm),
      child: AppBar(
        // Mostrar el botón de menú solo en searchboard en dispositivos móviles
        // En otras páginas, mostrar el botón de atrás
        // En searchboard con dispositivos de escritorio, no mostrar nada
        leading: !gbDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                icon: const Icon(Iconsax.menu4))
            : null,
        title: SizedBox(
          width: 900,
          child: TextFormField(
            controller: searchController.searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.search_normal),
              hintText: 'Buscar... ',
            ),
          ),
        ),
        actions: [
          if (!gbDeviceUtils.isDesktopScreen(context))
            IconButton(
                icon: const Icon(Iconsax.search_normal), onPressed: () {}),
          IconButton(icon: const Icon(Iconsax.notification), onPressed: () {}),
          const SizedBox(width: gbSizes.spaceBtwInputFields / 2),

          // Usar Obx para observar cambios en selectedUser
          Obx(() {
            final user = userController.selectedUser.value;

            // Si no hay usuario cargado todavía
            if (user == null) {
              // Intentar cargar datos si es necesario (primera vez)
              userController.fetchUserDetail();
              return const CircularProgressIndicator();
            }

            // Si hay usuario, mostrar la información
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(gbRoutes.userDetail);
                  },
                  child: gbRoundedImage(
                    imageType: ImageType.asset,
                    image: user.profilePicture.isEmpty
                        ? gbImages.user
                        : user.profilePicture,
                    width: 40,
                    padding: 2,
                    height: 40,
                  ),
                ),
                const SizedBox(width: gbSizes.sm),
                if (!gbDeviceUtils.isMobileScreen(context))
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(userController.getDefaultBranchId() ?? "Sin sucursal",
                        style: Theme.of(context).textTheme.labelSmall),
                      Text(user.email,
                          style: Theme.of(context).textTheme.labelMedium),
                      /*Text(user.role.name,
                          style: Theme.of(context).textTheme.labelSmall),*/

                    ],
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize =>
      Size.fromHeight(gbDeviceUtils.getAppBarHeight() + 15);
}

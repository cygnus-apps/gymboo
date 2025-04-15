import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/common/widgets/images/t_rounded_image.dart';
import 'package:gymboo_admin/features/personalization/controllers/user_controller.dart';
import 'package:gymboo_admin/features/personalization/models/user_model.dart';
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

  // Use the following instead of direct find:

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    return Container(
      decoration: const BoxDecoration(
          color: gbColors.white,
          border:
              Border(bottom: BorderSide(color: gbColors.lightGrey, width: 1))),
      padding: const EdgeInsets.symmetric(
          horizontal: gbSizes.md, vertical: gbSizes.sm),
      child: AppBar(
        leading: !gbDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                icon: const Icon(Iconsax.menu4))
            : null,
        title: SizedBox(
          width: 777,
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
          FutureBuilder<UserModel>(
            future: userController.fetchUserDetail(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Puedes mostrar un indicador de carga aquí
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Puedes mostrar un mensaje de error aquí
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final UserModel userModel = snapshot.data!;
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Get.toNamed(gbRoutes.userDetail, arguments: {'userModel': userModel});
                        //Get.toNamed(gbRoutes.userDetail, arguments: userModel);
                        Get.toNamed(gbRoutes.userDetail, arguments: {'userModel': userModel});
                        },
                        child: gbRoundedImage(
                          imageType: ImageType.asset,
                          image: userModel.profilePicture.isEmpty
                            ? gbImages.user
                            : userModel.profilePicture,
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
                          Text(userModel.role.name,
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(userModel.email,
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ),
                  ],
                );
              } else {
                // Puedes mostrar un estado por defecto si no hay datos
                return const SizedBox.shrink();
              }
            },
          ),
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

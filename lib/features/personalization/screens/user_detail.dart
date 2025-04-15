import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:gymboo_admin/features/personalization/controllers/user_controller.dart';
import 'package:gymboo_admin/features/personalization/models/user_model.dart';
import 'package:gymboo_admin/features/personalization/screens/user_detail_desktop.dart';



class gbUserDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userModel = UserController.instance.selectedUser.value;

      if (userModel == null) {
        return Scaffold(
          body: Center(child: Text('No hay usuario seleccionado')),
        );
      }

      return gbSiteTemplate(
        useLayout: true,
        desktop: gbUserDetailDesktop(userModel: userModel),
      );
    });
  }
}


/*class gbUserDetailScreen extends StatelessWidget {
  // Use key? key
  const gbUserDetailScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return gbSiteTemplate(
      useLayout: true,
      desktop: gbUserDetailDesktop(userModel: userModel),
    );
  }
}*/
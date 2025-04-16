import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:gymboo_admin/features/personalization/models/user_model.dart';
import 'package:gymboo_admin/features/personalization/screens/user_detail_desktop.dart';



class gbUserDetailScreen extends StatelessWidget {
  final UserModel? userModel;

  const gbUserDetailScreen({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {

    return gbSiteTemplate(
      useLayout: true,
      desktop: gbUserDetailDesktop(),
    );
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
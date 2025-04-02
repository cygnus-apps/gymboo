import 'package:flutter/material.dart';
import 'package:gymboo_admin/features/authentication/screen_reset_password/widgets/reset_password_widget.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';

class ResetPasswordScreenMobile extends StatelessWidget {
  const ResetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(gbSizes.defaultSpace),
          child: ResetPasswordWidget(),
        ),
      ),
    );
  }
}

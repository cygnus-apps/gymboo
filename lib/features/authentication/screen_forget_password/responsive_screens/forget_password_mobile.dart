import 'package:flutter/material.dart';
import 'package:gymboo_admin/features/authentication/screen_forget_password/widgets/header_form.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';

class ForgetPasswordScreenMobile extends StatelessWidget {
  const ForgetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(gbSizes.defaultSpace),
            child: HeaderAndForm(),
          )
      ),
    );
  }
}

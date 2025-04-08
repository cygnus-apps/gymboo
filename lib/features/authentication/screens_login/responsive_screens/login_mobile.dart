import 'package:flutter/material.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_form.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_header.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_social_button.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';

class LoginScreenMobile extends StatelessWidget{
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(gbSizes.defaultSpace),
        child: Column(
          children: [
            //Header
            gbLoginHeader(),
            //Forms
            gbLoginForm(),
            //google authentication
            gbSocialButton(),
          ],
        ),
        ),
      ),
      
    );
  }



}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_form.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_header.dart';



class LoginScreenDesktopTablet extends StatelessWidget {
  const LoginScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const gbLoginTemplate(
      child: Column(
        children: [
          //Header
          gbLoginHeader(),
          //Forms
          gbLoginForm(),
          //google authentication
          //gbSocialButton(),
        ],
      ),

    );//gbLoginTemplate
  }
}




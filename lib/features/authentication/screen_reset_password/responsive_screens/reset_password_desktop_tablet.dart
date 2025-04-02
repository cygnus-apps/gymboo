import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:gymboo_admin/features/authentication/screen_reset_password/widgets/reset_password_widget.dart';

class ResetPasswordScreenDesktopTablet extends StatelessWidget{
  const ResetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {

    return const gbLoginTemplate(
      child:ResetPasswordWidget() ,
    );
  }

}


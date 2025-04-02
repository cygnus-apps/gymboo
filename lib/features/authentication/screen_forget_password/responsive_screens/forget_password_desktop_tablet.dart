import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:gymboo_admin/features/authentication/screen_forget_password/widgets/header_form.dart';


class ForgetPasswordScreenDesktopTablet extends StatelessWidget{
  const ForgetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {

    return const gbLoginTemplate(
      child:HeaderAndForm() ,


    );
  }

}

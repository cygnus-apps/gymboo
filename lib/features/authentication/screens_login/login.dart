import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:gymboo_admin/features/authentication/screens_login/responsive_screens/login_desktop_tablet.dart';
import 'package:gymboo_admin/features/authentication/screens_login/responsive_screens/login_mobile.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen ({super.key});


  @override
  Widget build(BuildContext context) {
    return const
     gbSiteTemplate(useLayout: false,
                    desktop: LoginScreenDesktopTablet() ,
                    mobile: LoginScreenMobile()

     );

  }
}
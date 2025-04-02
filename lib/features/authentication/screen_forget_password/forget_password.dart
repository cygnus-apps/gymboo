import 'package:flutter/cupertino.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:gymboo_admin/features/authentication/screen_forget_password/responsive_screens/forget_password_desktop_tablet.dart';
import 'package:gymboo_admin/features/authentication/screen_forget_password/responsive_screens/forget_password_mobile.dart';

class ForgetPasswordScreen extends StatelessWidget{
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const gbSiteTemplate(
      useLayout: false,
      desktop: ForgetPasswordScreenDesktopTablet(),
      mobile: ForgetPasswordScreenMobile(),

    );
  }

}
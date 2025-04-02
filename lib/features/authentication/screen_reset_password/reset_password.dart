import 'package:flutter/cupertino.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:gymboo_admin/features/authentication/screen_reset_password/responsive_screens/reset_password_desktop_tablet.dart';
import 'package:gymboo_admin/features/authentication/screen_reset_password/responsive_screens/reset_password_mobile.dart';

class ResetPasswordScreen extends StatelessWidget{
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const gbSiteTemplate(
      useLayout: false,
      desktop: ResetPasswordScreenDesktopTablet(),
      mobile: ResetPasswordScreenMobile(),

    );
  }

}
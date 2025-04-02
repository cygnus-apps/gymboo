import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/responsive/responsive_design.dart';
import 'package:gymboo_admin/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:gymboo_admin/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:gymboo_admin/common/widgets/responsive/screens/tablet_layout.dart';

/// Template for the overall site layout, responsive_screens to different screen sizes
class gbSiteTemplate extends StatelessWidget {
  const gbSiteTemplate({super.key,  this.desktop,  this.tablet,  this.mobile, this.useLayout = true});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool useLayout ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: gbResponsiveWidget(
          desktop: useLayout ? DesktopLayout(body: desktop) : desktop ?? Container(),
          tablet: useLayout ? TabletLayout(body: tablet?? desktop) : tablet ?? desktop ?? Container() ,
          mobile: useLayout ? MobileLayout(body: mobile ?? desktop) : mobile ?? desktop ?? Container() ,
      ),
    );
  }
}
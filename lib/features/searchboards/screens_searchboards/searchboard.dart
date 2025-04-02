import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:gymboo_admin/features/searchboards/screens_searchboards/responsive_screens/searchboard_desktop.dart';


class Searchboardcreen extends StatelessWidget{
  const Searchboardcreen ({super.key});


  @override
  Widget build(BuildContext context) {
    return
     gbSiteTemplate(useLayout: true,
                    desktop: SearchboardScreenDesktop() ,
                    //tablet: SearchboardScreenTablet(),
                    //mobile: SearchboardScreenMobile(),

     );

  }
}
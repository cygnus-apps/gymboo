import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/headers/header.dart';
import 'package:gymboo_admin/common/widgets/layouts/sidebars/sidebar.dart';
/// Widget for the tablet layout
class MobileLayout extends StatelessWidget {
   MobileLayout({super.key, this.body});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Widget? body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const gbSitebar(),//side bar
      appBar:   gbHeader(scaffoldKey: scaffoldKey,  ),//app bar
      body: body ?? const SizedBox(),//cuerpo
    ); // scaffold
  }
}
/*class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
        body: gbRoundedContainer(
      width: double.infinity,
      height: 500,
      backgroundColor: Colors.blue,
    ));
  }
}*/

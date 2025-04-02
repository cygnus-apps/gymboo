import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/headers/header.dart';
import 'package:gymboo_admin/common/widgets/layouts/sidebars/sidebar.dart';
/// Widget for the tablet layout
class TabletLayout extends StatelessWidget {
    TabletLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer:   const gbSitebar(),
      appBar:   gbHeader(scaffoldKey: scaffoldKey,  ),
      body: body ?? const SizedBox(),
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

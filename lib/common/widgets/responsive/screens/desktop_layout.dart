import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/headers/header.dart';
import 'package:gymboo_admin/common/widgets/layouts/sidebars/sidebar.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key, required this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              const Expanded(
                flex: 1,
                child: gbSitebar(),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    // HEADER
                    gbHeader(scaffoldKey: scaffoldKey  ),

                    // BODY
                    Expanded(
                      child: body ?? Container(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /*@override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }*/
}




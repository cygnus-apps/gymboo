import 'package:flutter/material.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_form.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_header.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';

class SearchboardScreenMobile extends StatelessWidget{
  const SearchboardScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(gbSizes.defaultSpace),
        child: Column(
          children: [
            //Header
            gbLoginHeader(),
            //Forms
            gbLoginForm(),
          ],
        ),
        ),
      ),
      
    );
  }



}
//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_form.dart';
import 'package:gymboo_admin/features/authentication/screens_login/widgets/login_header.dart';



class SearchboardScreenTablet extends StatelessWidget {
  const SearchboardScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const gbLoginTemplate(
      child: Column(
        children: [
          //Header
          gbLoginHeader(),
          //Forms
          gbLoginForm(),
        ],
      ),

    );//gbLoginTemplate
  }
}




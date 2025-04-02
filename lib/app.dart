import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/utils/helpers/general_bindings.dart';
import 'package:gymboo_admin/utils/routes/app_routes.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';
import 'utils/constants/text_strings.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: gbTexts.appName,
      themeMode: ThemeMode.light,
      theme: gbAppTheme.lightTheme,
      darkTheme: gbAppTheme.darkTheme,
      getPages: gbAppRoutes.pages,
      initialRoute: gbRoutes.searchboard,
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      //scrollBehavior: MyCustomScrollBehavior(),
      unknownRoute: GetPage(
          name: '/page-not-fount',
          page: () => const Scaffold(
                body: Center(
                  child: Text('Page Not Found'),
                ),
              )),

    );
  }
}


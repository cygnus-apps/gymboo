import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/data/repositories/authentication/authentication_repository.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';

class gbRoutesMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // final authService = Get. find<AuthService>();
    print('------gbRoutesMiddleware------');
    return AuthenticationRepository.instance.isAuthenticated ? null : const RouteSettings(name: gbRoutes.login);
  }
}

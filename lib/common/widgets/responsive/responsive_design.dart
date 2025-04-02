import 'package:flutter/material.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';

/// Widget para mostrar diferentes diseños basados en el tamaño de la pantalla
class gbResponsiveWidget extends StatelessWidget {
  const gbResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  /// Widget para el diseño de escritorio
  final Widget desktop;

  /// Widget para el diseño de tableta
  final Widget tablet;

  /// Widget para el diseño de móvil
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= gbSizes.desktopScreenSize) {
          return desktop;
        } else if (constraints.maxWidth < gbSizes.desktopScreenSize &&
            constraints.maxWidth >= gbSizes.tabletScreenSize) {
          return tablet;
        } else {
          return mobile; // Corrección: se cambió "nobile" a "mobile"
        }
      },
    );
  }
}

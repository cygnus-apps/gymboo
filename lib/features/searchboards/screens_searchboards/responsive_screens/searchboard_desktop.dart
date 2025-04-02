import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/features/searchboards/controllers/search_board_controller.dart';
import 'package:gymboo_admin/features/searchboards/screens_searchboards/widgets/search_result.dart';

class SearchboardScreenDesktop extends StatelessWidget {
  SearchboardScreenDesktop({super.key}) {
    // Aseguramos que el controlador se inicialice antes de usarlo
    // Solo si no ha sido inicializado previamente
    if (!Get.isRegistered<SearchBoardController>()) {
      Get.put(SearchBoardController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          bottom: true,
          child: SearchResult(),
        ),
      ),
    );
  }
}
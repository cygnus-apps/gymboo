import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/features/searchboards/controllers/search_board_controller.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});

  final SearchBoardController controller = Get.find<SearchBoardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          final filteredItems = controller.filteredItems;

          return filteredItems.isEmpty
              ? const Center(
            child: Text(
              'Nada que Mostrar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
          )
              : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.0,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen de cabecera
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          // Fixed null safety issue with image
                          image: filteredItems[index].image.isNotEmpty
                              ? AssetImage(filteredItems[index].image) as ImageProvider
                              : const AssetImage('assets/images/default_card_image.jpg') as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue.shade300,
                            Colors.blue.shade600,
                          ],
                        ),
                      ),
                      // Superposición de íconos o elementos visuales según la categoría
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            filteredItems[index].icon,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),

                    // Contenido del card - Fix for overflow
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredItems[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8.0),
                            Expanded(
                              child: Text(
                                filteredItems[index].description,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black54,
                                  height: 1.3,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Botón o indicador visual
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // Acción al tocar el botón
                                    },
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      child: Text(
                                        'Ir',
                                        style: TextStyle(
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16.0,
                                  color: Colors.blue.shade700,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
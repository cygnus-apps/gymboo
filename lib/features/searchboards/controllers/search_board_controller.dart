import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/common/widgets/data_table/item_data.dart';
import 'package:iconsax/iconsax.dart';

class SearchBoardController extends GetxController {
  final searchText = ''.obs;
  final TextEditingController searchController = TextEditingController();


  final RxList<ItemData> filteredItems = <ItemData>[].obs;
  final List<ItemData> allItems = [
    ItemData(
      title: "Listas comunes",
      description: "Listas comunes utilizadas por Gymboo.",
      image: "assets/images/mantenimientos/mnt_listas.jpg",
      icon: Iconsax.document_text,
      category: "Parametros",
    ),
    ItemData(
      title: "Estados",
      description: "Estado comunes utilizadas por Gymboo",
      image: "assets/images/mantenimientos/mnt_estados.jpg",
      icon: Iconsax.status_up,
      category: "Parametros",
    ),
    ItemData(
      title: "Usuarios",
      description: "Mantenimiento de usuarios de sistema",
      image: "assets/images/mantenimientos/mnt_usuarios.jpg",
      icon: Iconsax.user,
      category: "Gimnasio",
    ),
    ItemData(
      title: "Clientes",
      description: "Clientes del gimnasio",
      image: "assets/images/mantenimientos/mnt_clientes.jpg",
      icon: Iconsax.people,
      category: "Gimnasio",
    ),
    ItemData(
      title: "Estilos",
      description: "Estilos utilizados en el gimnasio",
      image: "assets/images/mantenimientos/mnt_estilos.jpg",
      icon: Iconsax.brush,
      category: "App",
    ),
    ItemData(
      title: "Clases",
      description: "Clases de algún tipo de actividad especifica por ejemplo Zumba",
      image: "assets/images/mantenimientos/mnt_clases.jpg",
      icon: Iconsax.teacher,
      category: "Gimnasio",
    ),
    ItemData(
      title: "Noticias",
      description: "Configuración de la sección de noticias de la aplicación móvil",
      image: "assets/images/mantenimientos/mnt_noticias.jpg",
      icon: Iconsax.note,
      category: "App",
    ),
    ItemData(
      title: "Contactos App",
      description: "Contactos que aparecerán en la sección de contactos de la aplicación móvil",
      image: "assets/images/mantenimientos/mnt_contactos2.jpg",
      icon: Iconsax.call,
      category: "App",
    ),
    ItemData(
      title: "Zonas",
      description: "Zonas en las que está dividido el gimnasio por ejemplo peso libre, bicicletas, caminadoras.",
      image: "assets/images/mantenimientos/mnt_zonas.jpg",
      icon: Iconsax.map,
      category: "Gimnasio",
    ),
    ItemData(
      title: "Equipos",
      description: "Equipos que tiene el gimnasio, seriado o no seriado ejemplo mancuernas, maq. Polea, abductor sentado.",
      image: "assets/images/mantenimientos/mnt_equipos.jpg",
      icon: Iconsax.weight,
      category: "Gimnasio",
    ),
    ItemData(
      title: "Actividad",
      description: "Creación de actividades físicas, por ejemplo, press de banca, cross over.",
      image: "assets/images/mantenimientos/mnt_actividades.jpg",
      icon: Iconsax.activity,
      category: "Entrenamiento",
    ),
    ItemData(
      title: "Varios",
      description: "Mantenimiento de Intensidad – Grado -Tipo de actividad y Rango de Edades.",
      image: "assets/images/mantenimientos/mnt_varios.jpg",
      icon: Iconsax.setting,
      category: "Entrenamiento",
    ),
    ItemData(
      title: "Grupos Musculares",
      description: "Parametrización de Grupos Musculares.",
      image: "assets/images/mantenimientos/mnt_musculares.jpg",
      icon: Iconsax.health,
      category: "Entrenamiento",
    ),
    ItemData(
      title: "Datos biométricos",
      description: "Definición de datos biométricos medibles por el gimnacio",
      image: "assets/images/mantenimientos/mnt_biometrico.jpg",
      icon: Iconsax.chart,
      category: "Entrenamiento",
    ),
    ItemData(
      title: "Definición de rutinas",
      description: "Configuración de rutinas generales que podrían ser asignadas en los entrenamientos",
      image: "assets/images/mantenimientos/mnt_rutinas.JPG",
      icon: Iconsax.calendar,
      category: "Entrenamiento",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(_filterItems);
  }

  void _filterItems() {
    String searchTerm = searchController.text;
    searchText.value = searchTerm;

    if (searchTerm.isEmpty) {
      // Si el campo de búsqueda está vacío, no mostrar ningún elemento
      filteredItems.clear();
    } else if (searchTerm == "%") {
      // Si el campo de búsqueda contiene solo "%", mostrar todos los elementos
      filteredItems.assignAll(allItems); // Usar assignAll en lugar de value =
    } else {
      // Filtrar por el término de búsqueda
      List<ItemData> results = allItems
          .where((item) =>
          item.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
      filteredItems.assignAll(results); // Usar assignAll en lugar de value =
    }

    // Debug
    print("Search term: $searchTerm, Items found: ${filteredItems.length}");
  }

  void filterByCategory(String category) {
      String searchTerm = category; //searchController.text;
      searchText.value = searchTerm;

      if (searchTerm.isEmpty) {
        // Si el campo de búsqueda está vacío, no mostrar ningún elemento
        filteredItems.clear();
      } else if (searchTerm == "%") {
        // Si el campo de búsqueda contiene solo "%", mostrar todos los elementos
        filteredItems.assignAll(allItems); // Usar assignAll en lugar de value =
      } else {
        // Filtrar por el término de búsqueda
        List<ItemData> results = allItems
            .where((item) =>
            item.category.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();
        filteredItems.assignAll(results); // Usar assignAll en lugar de value =


      // Debug
      print("Search term: $searchTerm, Items found: ${filteredItems.length}");
    };



  }

  @override
  void onClose() {
    searchController.removeListener(_filterItems);
    searchController.dispose();
    super.onClose();
  }
}
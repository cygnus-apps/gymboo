import 'package:flutter/material.dart';
import 'package:gymboo_admin/common/widgets/images/t_rounded_image.dart';
import 'package:gymboo_admin/utils/constants/enums.dart';

class gbMaintenanceServiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onTap;

  const gbMaintenanceServiceCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen con altura fija
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child:
              //gbCircularImage(width:100, height: 100, image: gbImages.darkAppLogo,backgroundColor: Colors.green,              ),
                gbRoundedImage(
                  image: imageUrl ,
                  imageType: ImageType.asset,
                  width: 400,
                  height: 200,
                  borderRadius:20,
                  //overlayColor: Colors.green
                ),
            ),

            // Contenido del card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de detalles (ejemplo básico)
class MaintenanceDetailScreen extends StatelessWidget {
  final String title;

  const MaintenanceDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('Detalles de $title'),
      ),
    );
  }
}
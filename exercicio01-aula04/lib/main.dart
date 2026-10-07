import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria GridView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const GalleryScreen(),
    );
  }
}

// Modelo simples para os dados de cada item da grade
class GalleryItem {
  final String imagePath;
  final String title;

  const GalleryItem({required this.imagePath, required this.title});
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<GalleryItem> items = const [
    GalleryItem(imagePath: 'assets/images/tribal-portrait.jpg', title: 'Pintura facial'),
    GalleryItem(imagePath: 'assets/images/studio-chair.jpg', title: 'Cadeira de salão'),
    GalleryItem(imagePath: 'assets/images/virtual-reality.jpg', title: 'Realidade Virtual'),
    GalleryItem(imagePath: 'assets/images/historic-town.jpg', title: 'Cidade Histórica'),
    GalleryItem(imagePath: 'assets/images/wild-zebras.jpg', title: 'Zebras Selvagens'),
    GalleryItem(imagePath: 'assets/images/urban-city.jpg', title: 'Cidade Urbana'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.85, // Proporção para formato de card vertical
            children: items.map((item) => _buildGridItem(item)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(GalleryItem item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            item.imagePath,
            fit: BoxFit.cover,
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              color: Colors.black.withOpacity(0.55),
              child: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
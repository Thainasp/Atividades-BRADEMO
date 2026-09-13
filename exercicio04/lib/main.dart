import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: ImageExampleScreen(),
    );
  }
}

class ImageExampleScreen extends StatelessWidget {
  const ImageExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Insert Image Example',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF03A9F4), // Azul da barra original
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1ª Imagem: tamanho menor (como a das nuvens na referência)
            Image.asset(
              'assets/imagem1.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            // Widget SizedBox para separar as duas imagens
            const SizedBox(height: 24.0),

            // 2ª Imagem: tamanho maior (como a flor dente-de-leão na referência)
            Image.asset(
              'assets/imagem2.jpg',
              width: double.infinity,
              height: 320,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
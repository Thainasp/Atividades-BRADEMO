import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true, // Mantém a faixa "DEBUG" no canto superior direito como na imagem
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar verde com o título "Flutter is Fun!"
      appBar: AppBar(
        title: const Text(
          'Flutter is Fun!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Center(
        // Container quadrado de cor laranja/avermelhada
        child: Container(
          width: 120,
          height: 120,
          color: Colors.deepOrange, // ou Colors.orange[800] / Colors.redAccent
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Widget Text
              Text(
                'Hi Mom ',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              // Widget Icon
              Icon(
                Icons.waving_hand, // Ícone de aceno / mãozinha amarela
                color: Colors.amber,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
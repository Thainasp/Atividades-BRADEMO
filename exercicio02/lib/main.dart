import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ButtonSection(),
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Cor roxa dos ícones e textos da imagem
    const Color buttonColor = Color(0xFF5E35B1);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Botão CALL
          ButtonColumn(
            icon: Icons.phone,
            label: 'CALL',
            color: buttonColor,
          ),
          // Botão ROUTE
          ButtonColumn(
            icon: Icons.near_me,
            label: 'ROUTE',
            color: buttonColor,
          ),
          // Botão SHARE
          ButtonColumn(
            icon: Icons.share,
            label: 'SHARE',
            color: buttonColor,
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para montar cada par (Ícone em cima, Texto embaixo)
class ButtonColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const ButtonColumn({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Widget Icon
        Icon(
          icon,
          color: color,
          size: 32.0,
        ),
        // Espaçamento entre o ícone e o texto
        const SizedBox(height: 8.0),
        // Widget Text
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: color,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
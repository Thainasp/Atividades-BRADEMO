/* 
 * EXERCÍCIO 20: Calculando proporção de tela
 * Faça o SizedBox ocupar dinamicamente 30% (0.3) da altura total da tela física.
 * Complete o cálculo matemático.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: AlturaAdaptavel())));
}

class AlturaAdaptavel extends StatelessWidget {
  const AlturaAdaptavel({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        color: Colors.teal,
        // 1. Defina a altura proporcional (30% da altura da tela)
        height: size.height * 0.3, // Ocupará 30% da altura da tela
        width: 200,
        child: const Center(child: Text("30% da Altura")),
      ),
    );
  }
}

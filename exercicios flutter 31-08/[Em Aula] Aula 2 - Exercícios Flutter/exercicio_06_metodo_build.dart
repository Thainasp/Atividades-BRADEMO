/* 
 * EXERCÍCIO 6: Renderização de Widgets
 * Todo StatelessWidget precisa implementar um método que descreve como
 * ele se desenha na tela de acordo com seu contexto.
 * Complete a assinatura obrigatória do método.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: CardCustomizado()),
    ),
  ));
}

class CardCustomizado extends StatelessWidget {
  const CardCustomizado({super.key});

  // 1. Sobrescreva o método de construção informando o retorno e o tipo do contexto
  @override
  Widget build(BuildContext context) {
    return const Text("Card Renderizado");
  }
}

/* 
 * EXERCÍCIO 19: Consultando informações físicas do dispositivo
 * Com o MediaQuery podemos capturar as dimensões da tela em tempo de execução.
 * Complete a fórmula para ler a largura física total disponível.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: MeuWidgetResponsivo())));
}

class MeuWidgetResponsivo extends StatelessWidget {
  const MeuWidgetResponsivo({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Use o MediaQuery para obter os dados de tamanho da tela com o context
    var screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        color: Colors.orange,
        width: screenWidth * 0.8, // Ocupará 80% da tela
        height: 100,
        child: const Center(child: Text("80% da largura")),
      ),
    );
  }
}

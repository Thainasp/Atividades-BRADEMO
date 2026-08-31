/* 
 * EXERCÍCIO 5: Criando widgets customizados
 * No Flutter, criamos componentes visuais estendendo classes padrão.
 * Complete a declaração da classe 'MeuTexto' para ser um widget sem estado.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: MeuTexto()),
    ),
  ));
}

// 1. Faça a classe herdar de StatelessWidget
class MeuTexto extends StatelessWidget {
  const MeuTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Sou um StatelessWidget!");
  }
}

/* 
 * EXERCÍCIO 7: Desenhando a casca da aplicação (Scaffold)
 * O Scaffold nos dá acesso a áreas padrão como barra de título e corpo da página.
 * Complete as propriedades para definir a barra do app e o conteúdo central.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // 1. Insira o widget de casca estrutural
    home: Scaffold(
      // 2. Configure a barra do aplicativo
      appBar: AppBar(
        title: const Text("IFSP"),
      ),
      body: const Center(
        child: Text("Corpo do App"),
      ),
    ),
  ));
}

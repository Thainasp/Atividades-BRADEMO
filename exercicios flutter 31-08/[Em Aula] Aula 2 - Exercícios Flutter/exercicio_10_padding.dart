/* 
 * EXERCÍCIO 10: Adicionando margens internas (Padding)
 * Para afastar o conteúdo das bordas sem usar Container, usamos o widget Padding.
 * Complete o código adicionando um espaçamento de 16 pixels em todos os lados.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Padding(
          // 1. Configure o espaçamento interno uniforme em todas as direções (all)
          padding: EdgeInsets.all(16.0),
          child: Text("Conteúdo com espaçamento"),
        ),
      ),
    ),
  ));
}

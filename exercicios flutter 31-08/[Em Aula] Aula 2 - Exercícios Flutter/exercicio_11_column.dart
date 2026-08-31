/* 
 * EXERCÍCIO 11: Empilhamento vertical
 * A Column coloca seus elementos um abaixo do outro na tela.
 * Complete a declaração informando a lista de elementos filhos.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Column(
        // 1. Insira a propriedade que recebe o vetor de widgets filhos
        children: [
          Text("Linha 1"),
          Text("Linha 2"),
          Text("Linha 3"),
        ],
      ),
    ),
  ));
}

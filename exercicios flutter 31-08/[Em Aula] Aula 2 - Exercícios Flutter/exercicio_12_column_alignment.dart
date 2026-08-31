/* 
 * EXERCÍCIO 12: Eixo principal da coluna (MainAxis)
 * Na Column, o eixo principal (main) é a vertical.
 * Alinhe os itens para que fiquem centralizados verticalmente na tela.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Column(
        // 1. Centralize os filhos no eixo principal
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Centralizado Verticalmente 1"),
          Text("Centralizado Verticalmente 2"),
        ],
      ),
    ),
  ));
}

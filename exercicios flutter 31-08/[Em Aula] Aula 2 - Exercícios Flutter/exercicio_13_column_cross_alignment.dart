/* 
 * EXERCÍCIO 13: Eixo cruzado na coluna (CrossAxis)
 * Na Column, o eixo cruzado (cross) é a horizontal.
 * Alinhe os itens para que comecem todos alinhados à esquerda (início).
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Column(
        // 1. Alinhe os filhos ao início do eixo horizontal (cruzado)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Alinhado à esquerda"),
          Text("Texto maior que força largura da coluna"),
        ],
      ),
    ),
  ));
}

/* 
 * EXERCÍCIO 15: Distribuição uniforme de espaço na horizontal
 * Para separar os elementos em uma Row de forma que o espaço fique 
 * distribuído igualmente entre os filhos, usamos um alinhamento especial.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Row(
        // 1. Configure para distribuir o espaço de forma igual entre os itens (spaceBetween)
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Esquerda"),
          Text("Direita"),
        ],
      ),
    ),
  ));
}

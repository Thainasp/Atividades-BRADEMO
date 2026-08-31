/* 
 * EXERCÍCIO 14: Alinhamento horizontal lado a lado
 * A Row coloca seus elementos filhos um ao lado do outro na tela.
 * Complete a estrutura abaixo.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Insira o widget para disposição horizontal
        child: Row (
          children: [
            Icon(Icons.star),
            Text("Estrela"),
          ],
        ),
      ),
    ),
  ));
}

/* 
 * EXERCÍCIO 18: Adicionando margem de afastamento externo
 * Ao contrário do Padding, a Margem afasta o próprio Container de seus vizinhos.
 * Complete o parâmetro com margem uniforme de 20 pixels.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        // 1. Adicione a margem externa
        margin: const EdgeInsets.all(20.0),
        color: Colors.green,
        child: const Text("Distante das bordas da tela"),
      ),
    ),
  ));
}

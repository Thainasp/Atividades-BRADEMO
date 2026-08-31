/* 
 * EXERCÍCIO 24: Delimitando coordenadas na Stack
 * Para controlar exatamente em que parte da Stack um elemento ficará flutuando, 
 * encapsulamos o filho em um widget de coordenadas (top, bottom, left, right).
 * Faça o botão flutuar a 20 pixels do canto inferior direito.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.grey),
          // 1. Insira o widget de posicionamento absoluto
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    ),
  ));
}

/* 
 * EXERCÍCIO 23: Sobrepondo elementos visuais
 * O widget Stack nos permite criar uma pilha onde as últimas crianças declaradas 
 * ficam desenhadas por cima das primeiras.
 * Complete o nome do widget de pilha.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Declare o widget de empilhamento de camadas
        child: Stack(
          children: [
            Container(width: 200, height: 200, color: Colors.blue),
            Container(width: 100, height: 100, color: Colors.yellow), // Ficará por cima
          ],
        ),
      ),
    ),
  ));
}

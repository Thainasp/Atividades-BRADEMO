/* 
 * EXERCÍCIO 26: Alternador deslizante (Switch)
 * Pertencente à categoria de Inputs, o Switch serve para ligar ou desligar opções.
 * Complete o código de inicialização.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Complete com o widget Switch do Material Design
        child: Switch (
          value: false,
          onChanged: (bool valor) {
            print("Novo estado: $valor");
          },
        ),
      ),
    ),
  ));
}

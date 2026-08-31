/* 
 * EXERCÍCIO 27: Slider para seleção contínua de valores
 * O Slider permite arrastar um botão para selecionar um número em uma faixa de valores.
 * Complete o widget informando o valor atual e limites.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Insira o widget de barra deslizante
        child: Slider (
          value: 45.0,
          min: 0.0,
          max: 100.0,
          onChanged: (double novoValor) {
            print("Volume alterado para: $novoValor");
          },
        ),
      ),
    ),
  ));
}

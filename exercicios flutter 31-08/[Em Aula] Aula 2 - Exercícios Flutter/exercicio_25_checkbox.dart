/* 
 * EXERCÍCIO 25: Input booleano simples (Checkbox)
 * O Checkbox é um clássico elemento da categoria de Inputs.
 * Complete a declaração definindo se está ativo e seu escopo de mudança.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Declare o widget de checkbox
        child: Checkbox (
          value: true,
          // 2. Informe o callback que é disparado ao clicar
          onChanged: (bool? novoValor) {
            print("Alterado para: $novoValor");
          },
        ),
      ),
    ),
  ));
}

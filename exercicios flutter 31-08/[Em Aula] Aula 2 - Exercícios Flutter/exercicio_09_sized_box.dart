/* 
 * EXERCÍCIO 9: SizedBox como bloco de espaçamento ou tamanho fixo
 * O SizedBox define uma área retangular com largura e altura predefinidas.
 * Defina uma caixa invisível com 150 de largura e 50 de altura.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
          // 1. Adicione as dimensões corretas do SizedBox
          child: const SizedBox(
            width: 150.0,
            height: 50.0,
            child: Text("SizedBox delimitado"),
          ),
        ),
      ),
    ),
  ));
}

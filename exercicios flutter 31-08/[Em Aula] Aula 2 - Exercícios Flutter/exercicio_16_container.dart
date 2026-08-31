/* 
 * EXERCÍCIO 16: O Container como caixa genérica
 * O Container permite definir tamanho e cor de fundo para blocos visuais.
 * Crie uma caixa azul com 200 de largura e 100 de altura.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          // 1. Adicione a largura, altura e cor correspondentes
          width: 200,
          height: 100,
          color: Colors.blue,
          child: const Center(child: Text("Caixa Azul")),
        ),
      ),
    ),
  ));
}

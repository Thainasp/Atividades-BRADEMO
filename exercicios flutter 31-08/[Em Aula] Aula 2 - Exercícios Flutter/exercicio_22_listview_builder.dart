/* 
 * EXERCÍCIO 22: O construtor dinâmico de listas
 * Para listas muito grandes ou infinitas, o Flutter cria itens apenas 
 * conforme aparecem na tela, otimizando memória. Usamos o construtor builder.
 * Complete os campos com a quantidade e a função construtora.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ListView.builder (
        // 1. Defina o número total de itens para renderizar na lista (ex: 50 itens)
        itemCount: 50,
        // 2. Chame a função construtora que recebe context e o índice atual
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Aluno número: $index"),
          );
        },
      ),
    ),
  ));
}

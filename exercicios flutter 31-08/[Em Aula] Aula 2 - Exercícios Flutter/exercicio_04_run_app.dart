/* 
 * EXERCÍCIO 4: O ponto de partida do aplicativo
 * Todo app Flutter necessita de uma função que infle os widgets na tela.
 * Complete o ponto de entrada chamando a função principal do Flutter.
 */

import 'package:flutter/material.dart';

void main() {
  // 1. Execute a aplicação inicializando o MaterialApp diretamente
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: Text("App Rodando!")),
    ),
  ));
}

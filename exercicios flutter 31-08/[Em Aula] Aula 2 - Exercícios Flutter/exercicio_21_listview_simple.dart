/* 
 * EXERCÍCIO 21: Suporte básico a rolagem de tela
 * Quando uma tela tem muitos itens e estoura o limite vertical, usamos o ListView.
 * Complete o widget que substitui a Column para ativar a rolagem.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ListView(
        children: const [
          Text("Opção A"),
          SizedBox(height: 300), // Simula espaçamento grande
          Text("Opção B"),
          SizedBox(height: 300),
          Text("Opção C"),
        ],
      ),
    ),
  ));
}

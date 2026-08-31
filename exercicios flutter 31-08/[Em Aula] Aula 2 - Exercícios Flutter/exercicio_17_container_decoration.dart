/* 
 * EXERCÍCIO 17: Decoração de caixas
 * Atenção: se usarmos 'decoration' no Container, a cor de fundo deve estar 
 * obrigatoriamente dentro dela, sob o risco de crash no app.
 * Adicione bordas circulares com raio de 12 pixels no Container.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          // 1. Adicione o objeto de decoração
          decoration: const BoxDecoration(
            color: Colors.red,
            // 2. Arredonde as bordas em 12 pixels
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: const Center(child: Text("Bordas Redondas")),
        ),
      ),
    ),
  ));
}

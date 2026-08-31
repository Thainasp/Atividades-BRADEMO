/* 
 * EXERCÍCIO 8: Alinhamento ao centro
 * Para alinhar um widget no centro geométrico do espaço disponível,
 * utilizamos o Center. Ele recebe apenas um único filho.
 * Complete o atributo para vincular o Text ao Center.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Informe a propriedade de filho único para abrigar o Text
        child: Text("Texto Centralizado"),
      ),
    ),
  ));
}

/* 
 * EXERCÍCIO 3: Importando a biblioteca visual padrão
 * Para termos acesso aos componentes de interface que seguem o guia visual
 * do Android (Material Design), precisamos importar o pacote correto.
 * Complete a importação abaixo.
 */

// 1. Importe o pacote material do Flutter
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: Text("Biblioteca Importada!")),
    ),
  ));
}

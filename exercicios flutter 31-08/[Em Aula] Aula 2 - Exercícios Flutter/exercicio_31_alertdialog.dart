/* 
 * EXERCÍCIO 31: Alertas e Diálogos de Confirmação
 * Um AlertDialog impede o usuário de usar o app até que tome uma decisão.
 * Complete a declaração do widget de Alerta.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Declare a caixa de diálogo padrão para alerta
        child: AlertDialog(
          title: Text("Alerta Geral"),
          content: Text("O sistema fará logoff."),
        ),
      ),
    ),
  ));
}

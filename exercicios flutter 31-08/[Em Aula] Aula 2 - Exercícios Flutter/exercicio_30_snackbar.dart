/* 
 * EXERCÍCIO 30: Mensagem rápida e temporária no rodapé
 * O SnackBar surge na parte de baixo da tela informando um status de background.
 * Complete a chamada para mostrar a barra no scaffold ativo.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                // 1. Execute a chamada para mostrar o SnackBar no Scaffold Messenger
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Ação Concluída!")),
                );
              },
              child: const Text("Salvar"),
            );
          }
        ),
      ),
    ),
  ));
}

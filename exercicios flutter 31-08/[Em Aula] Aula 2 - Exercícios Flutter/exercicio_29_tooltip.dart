/* 
 * EXERCÍCIO 29: Balão explicativo flutuante (Tooltip)
 * Utilizado para mostrar uma rápida descrição em texto quando o usuário mantém 
 * pressionado um widget de botão ou imagem.
 * Envolva o ícone no Tooltip com a mensagem de ajuda "Deletar".
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Defina o widget de dica de texto rápido
        child: Tooltip (
          message: "Deletar",
          child: Icon(Icons.delete),
        ),
      ),
    ),
  ));
}

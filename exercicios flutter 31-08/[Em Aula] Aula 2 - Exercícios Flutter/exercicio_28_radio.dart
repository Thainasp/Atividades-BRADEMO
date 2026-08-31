/* 
 * EXERCÍCIO 28: Elementos de seleção exclusiva (Radio)
 * O Radio permite selecionar apenas uma única opção entre várias.
 * Complete o construtor associando a chave de agrupamento correta.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        // 1. Declare o widget Radio configurando o valor do botão e do grupo ativo
        child: Radio<String>(
          value: "IFSP_SPO",
          groupValue: "IFSP_SPO",
          onChanged: (String? valor) {
            print("Opção escolhida: $valor");
          },
        ),
      ),
    ),
  ));
}

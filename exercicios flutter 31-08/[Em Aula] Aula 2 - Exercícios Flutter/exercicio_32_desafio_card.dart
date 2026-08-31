/* 
 * EXERCÍCIO 32: DESAFIO DE INTEGRAÇÃO COMPLETO
 * Neste exercício avançado, você deve misturar o aprendizado de MediaQuery, 
 * herança de StatelessWidget, customização de BoxDecoration no Container e Rows.
 * Monte um "Card de Perfil" bonito e que consuma exatamente 90% da largura da tela.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: CardPerfil(),
      ),
    ),
  ));
}

class CardPerfil extends StatelessWidget {
  const CardPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Capture a largura física do aparelho usando MediaQuery
    double larguraTela = MediaQuery.of(context).size.width;

    return Container(
      // 2. Defina a largura para ocupar exatamente 90% (0.9) da tela
      width: larguraTela * 0.9,
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Center(
        // 3. Coloque uma estrutura horizontal de elementos lado a lado
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.person, size: 48, color: Colors.white),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Prof. Luiz Gustavo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("IFSP - Campus SPO", style: TextStyle(color: Colors.white70)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

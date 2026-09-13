import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StackScreen(),
    );
  }
}

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Stack & Positioned Widget',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF2196F3), // Azul padrão da barra superior
      ),
      body: Center(
        // Alinhamento puxado para a parte superior da tela como no modelo
        child: Align(
          alignment: const Alignment(0.0, -0.7),
          child: SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              children: [
                // 1º Container: Verde (fundo da pilha)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 170,
                    height: 170,
                    color: const Color(0xFF81C784), // Verde claro
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Green',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                // 2º Container: Vermelho (camada intermediária)
                Positioned(
                  top: 35,
                  left: 35,
                  child: Container(
                    width: 170,
                    height: 170,
                    color: const Color(0xFFE57373), // Vermelho intermediário
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Red',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                // 3º Container: Roxo (topo da pilha)
                Positioned(
                  top: 70,
                  left: 70,
                  child: Container(
                    width: 170,
                    height: 170,
                    color: const Color(0xFFBA68C8), // Roxo claro
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Purple',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
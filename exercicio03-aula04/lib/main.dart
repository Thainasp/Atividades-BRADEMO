import 'package:flutter/material.dart';

void main() {
  runApp(const ConstraintsApp());
}

class ConstraintsApp extends StatefulWidget {
  const ConstraintsApp({super.key});

  @override
  State<ConstraintsApp> createState() => _ConstraintsAppState();
}

class _ConstraintsAppState extends State<ConstraintsApp> {
  int _currentExample = 1;

  static const TextStyle big = TextStyle(fontSize: 30);

  // Cada case retorna o trecho de código publicado na documentação
  Widget _buildExample(int index) {
    switch (index) {
      // Exemplo 1
      case 1:
        return Container(color: Colors.red);

      // Exemplo 2
      case 2:
        return Container(width: 100, height: 100, color: Colors.red);

      // Exemplo 3
      case 3:
        return Center(
          child: Container(width: 100, height: 100, color: Colors.red),
        );

      // Exemplo 4
      case 4:
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(width: 100, height: 100, color: Colors.red),
        );

      // Exemplo 5
      case 5:
        return Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
          ),
        );

      // Exemplo 6
      case 6:
        return Center(child: Container(color: Colors.red));

      // Exemplo 7
      case 7:
        return Center(
          child: Container(
            color: Colors.red,
            child: Container(color: Colors.green, width: 30, height: 30),
          ),
        );

      // Exemplo 8
      case 8:
        return Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.red,
            child: Container(color: Colors.green, width: 30, height: 30),
          ),
        );

      // Exemplo 9
      case 9:
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 70,
            minHeight: 70,
            maxWidth: 150,
            maxHeight: 150,
          ),
          child: Container(color: Colors.red, width: 10, height: 10),
        );

      // Exemplo 10
      case 10:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: Container(color: Colors.red, width: 10, height: 10),
          ),
        );

      // Exemplo 11
      case 11:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: Container(color: Colors.red, width: 1000, height: 1000),
          ),
        );

      // Exemplo 12
      case 12:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: Container(color: Colors.red, width: 100, height: 100),
          ),
        );

      // Exemplo 13
      case 13:
        return UnconstrainedBox(
          child: Container(color: Colors.red, width: 20, height: 50),
        );

      // Exemplo 14
      case 14:
        return UnconstrainedBox(
          child: Container(color: Colors.red, width: 4000, height: 50),
        );

      // Exemplo 15
      case 15:
        return OverflowBox(
          minWidth: 0,
          minHeight: 0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Container(color: Colors.red, width: 4000, height: 50),
        );

      // Exemplo 16
      case 16:
        return UnconstrainedBox(
          child: Container(
            color: Colors.red,
            width: double.infinity,
            height: 100,
          ),
        );

      // Exemplo 17
      case 17:
        return UnconstrainedBox(
          child: LimitedBox(
            maxWidth: 100,
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: 100,
            ),
          ),
        );

      // Exemplo 18
      case 18:
        return const FittedBox(child: Text('Some Example Text.'));

      // Exemplo 19
      case 19:
        return const Center(
          child: FittedBox(child: Text('Some Example Text.')),
        );

      // Exemplo 20
      case 20:
        return const Center(
          child: FittedBox(
            child: Text(
              'This is some very very very large text that is too big to fit a regular screen in a single line.',
            ),
          ),
        );

      // Exemplo 21
      case 21:
        return const Center(
          child: Text(
            'This is some very very very large text that is too big to fit a regular screen in a single line.',
          ),
        );

      // Exemplo 22
      case 22:
        return FittedBox(
          child: Container(
            height: 20,
            width: double.infinity,
            color: Colors.red,
          ),
        );

      // Exemplo 23
      case 23:
        return Row(
          children: [
            Container(
              color: Colors.red,
              child: const Text('Hello!', style: big),
            ),
            Container(
              color: Colors.green,
              child: const Text('Goodbye!', style: big),
            ),
          ],
        );

      // Exemplo 24
      case 24:
        return Row(
          children: [
            Container(
              color: Colors.red,
              child: const Text(
                'This is a very long text that won\'t fit the line.',
                style: big,
              ),
            ),
            Container(
              color: Colors.green,
              child: const Text('Goodbye!', style: big),
            ),
          ],
        );

      // Exemplo 25
      case 25:
        return Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  color: Colors.red,
                  child: const Text(
                    'This is a very long text that won\'t fit the line.',
                    style: big,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              child: const Text('Goodbye!', style: big),
            ),
          ],
        );

      // Exemplo 26
      case 26:
        return Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                child: const Text(
                  'This is a very long text that won\'t fit the line.',
                  style: big,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: const Text('Goodbye!', style: big),
              ),
            ),
          ],
        );

      // Exemplo 27
      case 27:
        return Row(
          children: [
            Flexible(
              child: Container(
                color: Colors.red,
                child: const Text(
                  'This is a very long text that won\'t fit the line.',
                  style: big,
                ),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.green,
                child: const Text('Goodbye!', style: big),
              ),
            ),
          ],
        );

      // Exemplo 28
      case 28:
        return Scaffold(
          body: Container(
            color: Colors.blue,
            child: const Column(children: [Text('Hello!'), Text('Goodbye!')]),
          ),
        );

      // Exemplo 29
      case 29:
        return Scaffold(
          body: SizedBox.expand(
            child: Container(
              color: Colors.blue,
              child: const Column(children: [Text('Hello!'), Text('Goodbye!')]),
            ),
          ),
        );

      default:
        return Container(color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Positioned.fill(
              top: 55,
              child: Material(
                color: const Color(0xFFCCCCCC), // Fundo cinzento oficial
                child: _buildExample(_currentExample),
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 55,
              child: Material(
                color: const Color(0xFF263238),
                elevation: 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  itemCount: 29,
                  itemBuilder: (context, index) {
                    final exNumber = index + 1;
                    final isSelected = exNumber == _currentExample;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? const Color(0xFFFFC107)
                              : const Color(0xFF37474F),
                          foregroundColor: isSelected
                              ? Colors.black
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          elevation: isSelected ? 2 : 0,
                        ),
                        onPressed: () =>
                            setState(() => _currentExample = exNumber),
                        child: Text(
                          '$exNumber',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Future<String> fetchNewUsername() => Future.delayed(
      const Duration(seconds: 1),
      () => throw Exception('Cannot locate user'),
    );

Future<String> logoutUser() => Future.delayed(
      const Duration(seconds: 1),
      () => throw Exception('Network timeout during logout'),
    );

Future<String> changeUsername() async {
  try {
    return await fetchNewUsername();
  } catch (err) {
    return err.toString();
  }
}

Future<String> sayGoodbye() async {
  try {
    final result = await logoutUser();
    return '$result Thanks, see you next time';
  } catch (_) {
    return 'Erro ao encerrar a sessão. Tente novamente mais tarde.';
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 2 - Tratamento de Erros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ErrorHandlingHomePage(),
    );
  }
}

class ErrorHandlingHomePage extends StatefulWidget {
  const ErrorHandlingHomePage({super.key});

  @override
  State<ErrorHandlingHomePage> createState() => _ErrorHandlingHomePageState();
}

class _ErrorHandlingHomePageState extends State<ErrorHandlingHomePage> {
  late final Future<String> _changeUsernameFuture;
  late final Future<String> _sayGoodbyeFuture;

  @override
  void initState() {
    super.initState();
    _changeUsernameFuture = changeUsername();
    _sayGoodbyeFuture = sayGoodbye();
  }

  Widget _buildResultCard({
    required String title,
    required IconData icon,
    required Future<String> future,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<String>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.hasError) {
              return Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Erro não capturado: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            }

            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(snapshot.data ?? 'Sem dados retornados'),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade 2 - Tratamento de Erros'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildResultCard(
            title: 'exercício: changeUsername()',
            icon: Icons.sync_problem_outlined,
            future: _changeUsernameFuture,
          ),
          _buildResultCard(
            title: 'exercício: sayGoodbye()',
            icon: Icons.logout_outlined,
            future: _sayGoodbyeFuture,
          ),
        ],
      ),
    );
  }
}
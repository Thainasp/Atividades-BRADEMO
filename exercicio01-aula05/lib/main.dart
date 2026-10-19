import 'package:flutter/material.dart';

Future<String> fetchRole() =>
    Future.delayed(const Duration(seconds: 1), () => 'administrator');

Future<int> fetchLoginAmount() =>
    Future.delayed(const Duration(seconds: 1), () => 42);

Future<String> reportUserRole() async {
  final role = await fetchRole();
  return 'User role: $role';
}

Future<String> reportLogins() async {
  final logins = await fetchLoginAmount();
  return 'Total number of logins: $logins';
}

void main() {
  runApp(const AsyncActivityApp());
}

class AsyncActivityApp extends StatelessWidget {
  const AsyncActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 1 - Async & Await',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<String> _userRoleFuture;
  late final Future<String> _loginsFuture;

  @override
  void initState() {
    super.initState();
    _userRoleFuture = reportUserRole();
    _loginsFuture = reportLogins();
  }

  Widget _buildAsyncCard({
    required String title,
    required IconData icon,
    required Future<String> future,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<String>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CircularProgressIndicator.adaptive(),
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
                      'Erro: ${snapshot.error}',
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
              subtitle: Text(
                snapshot.data ?? 'Sem dados',
                style: Theme.of(context).textTheme.bodyLarge,
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
        title: const Text('Programação Assíncrona: Dart & Flutter'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAsyncCard(
            title: 'exercício 1: Papel do Usuário',
            icon: Icons.person_outline,
            future: _userRoleFuture,
          ),
          const SizedBox(height: 12),
          _buildAsyncCard(
            title: 'exercício 2: Contagem de Logins',
            icon: Icons.login_outlined,
            future: _loginsFuture,
          ),
        ],
      ),
    );
  }
}
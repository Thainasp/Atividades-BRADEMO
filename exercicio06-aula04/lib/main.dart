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
      home: TaskListPage(),
    );
  }
}

class TaskItem {
  final String title;
  bool isCompleted;

  TaskItem({required this.title, this.isCompleted = false});
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final List<TaskItem> _tasks = [
    TaskItem(title: 'Task 2022-07-09\n18:08:31.734244'),
    TaskItem(title: 'Task 2022-07-09\n18:08:32.210300'),
    TaskItem(title: 'Task 2022-07-09\n18:08:32.629026'),
    TaskItem(title: 'Task 2022-07-09\n18:08:33.073472'),
    TaskItem(title: 'Task 2022-07-09\n18:08:33.524172'),
  ];

  void _showInfoDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informação'),
          content: const SingleChildScrollView(
            child: Text('Você está no App de Notas de Tarefas'),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final uncompletedCount = _tasks.where((t) => !t.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text('View Completed Tasks'),
            ),
            const SizedBox(height: 16),

            Text(
              'You have $uncompletedCount uncompleted tasks',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return Card(
                    color: const Color(0xFFFFD54F),
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            task.title,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              height: 1.3,
                            ),
                          ),
                          Checkbox(
                            value: task.isCompleted,
                            activeColor: Colors.blue,
                            onChanged: (bool? value) {
                              setState(() {
                                task.isCompleted = value ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showInfoDialog,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
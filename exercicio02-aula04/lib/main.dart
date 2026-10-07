import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layouts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layouts'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.white24,
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: isPortrait ? _buildPortraitLayout() : _buildLandscapeLayout(),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        const SizedBox(height: 25),
        const Text(
          'Cheetah Coding',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('BUTTON 1'),
            const SizedBox(width: 25),
            _buildButton('BUTTON 2'),
          ],
        ),
        const SizedBox(height: 30),
        const Divider(color: Colors.white38, height: 1),
        Expanded(
          child: _buildLanguageList(),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cheetah Coding',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              _buildButton('BUTTON 1', width: 140),
              const SizedBox(height: 12),
              _buildButton('BUTTON 2', width: 140),
            ],
          ),
        ),
        const VerticalDivider(color: Colors.white38, width: 1),
        Expanded(
          flex: 1,
          child: _buildLanguageList(),
        ),
      ],
    );
  }

  Widget _buildLanguageList() {
    final languages = ['Dart', 'JavaScript', 'PHP', 'C++'];

    return ListView.separated(
      itemCount: languages.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.white38, height: 1),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            languages[index],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton(String text, {double width = 110}) {
    return SizedBox(
      width: width,
      height: 36,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
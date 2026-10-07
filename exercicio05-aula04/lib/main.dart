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
      home: BottomBarWithFabDemo(),
    );
  }
}

class BottomBarWithFabDemo extends StatefulWidget {
  const BottomBarWithFabDemo({super.key});

  @override
  State<BottomBarWithFabDemo> createState() => _BottomBarWithFabDemoState();
}

class _BottomBarWithFabDemoState extends State<BottomBarWithFabDemo> {
  int _selectedTab = 3;
  bool _isMenuOpen = false;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  Widget _buildTabItem({
    required IconData icon,
    required String text,
    required int index,
  }) {
    final isSelected = _selectedTab == index;
    final color = isSelected ? Colors.red : Colors.grey;

    return Expanded(
      child: InkWell(
        onTap: () => _onTabSelected(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(height: 2),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiniAction(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.blue),
        onPressed: () {
          _toggleMenu();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar with FAB'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Text(
              'TAB: $_selectedTab',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
            ),
          ),

          if (_isMenuOpen)
            Positioned(
              bottom: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMiniAction(Icons.chat_bubble_outline),
                  _buildMiniAction(Icons.mail_outline),
                  _buildMiniAction(Icons.phone),
                  const SizedBox(height: 20),
                ],
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleMenu,
        backgroundColor: Colors.blue,
        elevation: 4.0,
        shape: const CircleBorder(),
        child: Icon(_isMenuOpen ? Icons.close : Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          children: [
            _buildTabItem(icon: Icons.menu, text: 'This', index: 1),
            _buildTabItem(icon: Icons.layers, text: 'Is', index: 2),

            Expanded(
              child: InkWell(
                onTap: () => _onTabSelected(3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0, bottom: 4.0),
                  child: Text(
                    'A',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _selectedTab == 3 ? Colors.red : Colors.grey,
                      fontSize: 12,
                      fontWeight: _selectedTab == 3
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),

            _buildTabItem(icon: Icons.dashboard, text: 'Bottom', index: 4),
            _buildTabItem(icon: Icons.info, text: 'Bar', index: 5),
          ],
        ),
      ),
    );
  }
}

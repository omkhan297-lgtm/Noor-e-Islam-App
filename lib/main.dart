import 'package:flutter/material.dart';

void main() {
  runApp(const NoorEIslamApp());
}

class NoorEIslamApp extends StatelessWidget {
  const NoorEIslamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noor-e-Islam',
      theme: ThemeData(
        primaryColor: const Color(0xFF0F3D2E),
        scaffoldBackgroundColor: const Color(0xFFF9F9F6),
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const Center(child: Text("Quran Majeed Screen", style: TextStyle(fontSize: 18))),
    const Center(child: Text("Masnoon Duas Screen", style: TextStyle(fontSize: 18))),
    const TasbeehScreen(),
    const Center(child: Text("More Screen", style: TextStyle(fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF0F3D2E),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Quran'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Duas'),
          BottomNavigationBarItem(icon: Icon(Icons.circle_outlined), label: 'Tasbeeh'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Assalamu Alaikum",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F3D2E)),
            ),
            const Text("May Allah bless your day", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0F3D2E),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  Text("Friday, 24 May 2024", style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text("16 Dhul Qadah 1445 AH", style: TextStyle(color: Colors.amber, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildGridItem(Icons.access_time, "Prayer Times"),
                _buildGridItem(Icons.explore, "Qibla Direction"),
                _buildGridItem(Icons.menu_book, "Quran"),
                _buildGridItem(Icons.clean_hands, "Duas"),
                _buildGridItem(Icons.fingerprint, "Tasbeeh"),
                _buildGridItem(Icons.calendar_month, "Calendar"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF0F3D2E), size: 32),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digital Tasbeeh", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0F3D2E),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("SubhanAllah", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Text('$_counter / 33', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF0F3D2E))),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F3D2E),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(40),
              ),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Icon(Icons.add, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.red, size: 30),
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

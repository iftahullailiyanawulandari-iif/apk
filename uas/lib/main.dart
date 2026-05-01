import 'package:flutter/material.dart';

void main() {
  runApp(const SmartLaundryApp());
}

class SmartLaundryApp extends StatelessWidget {
  const SmartLaundryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Laundry Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5), // Blue theme
          primary: const Color(0xFF1E88E5),
          background: const Color(0xFFF8F9FA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        useMaterial3: true,
        fontFamily: 'Inter', // Assuming modern font like Inter or Poppins
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const TrackingTab(),
    const CalculatorTab(),
    const HistoryTab(),
    const MapsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: const Color(0xFF1E88E5),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined), activeIcon: Icon(Icons.search), label: 'Tracking'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), activeIcon: Icon(Icons.calculate), label: 'Kalkulator'),
            BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), activeIcon: Icon(Icons.receipt_long), label: 'Riwayat'),
            BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), activeIcon: Icon(Icons.location_on), label: 'Maps'),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// 1. HOME TAB
// ---------------------------------------------------------
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

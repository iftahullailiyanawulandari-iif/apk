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
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Blue Header Section
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 60),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E88E5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Smart\nLaundry Hub',
                              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, height: 1.2),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Kelola cucian jadi lebih mudah\ncepat & praktis',
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      // Notification Bell
                      Container(
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Badge(
                            label: Text('2'),
                            backgroundColor: Colors.red,
                            child: Icon(Icons.notifications_none, color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                // Overlapping Card
                Positioned(
                  bottom: -30,
                  left: 24,
                  right: 24,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.local_laundry_service, color: Color(0xFF1E88E5), size: 32),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cucian Aktif', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              SizedBox(height: 4),
                              Text('2 pesanan sedang diproses', style: TextStyle(color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            
            // Content Below Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tambah Order Baru Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text('Tambah Order Baru', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E88E5),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Ringkasan Bulan Ini
                  const Text('Ringkasan Bulan Ini', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSummaryCard(
                          title: 'Total Pengeluaran',
                          value: 'Rp 150.000',
                          subtitle: '▲ 12% dari bulan lalu',
                          subtitleColor: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildSummaryCard(
                          title: 'Total Cucian',
                          value: '6x',
                          subtitle: '▲ 2x dari bulan lalu',
                          subtitleColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Status Terakhir
                  const Text('Status Terakhir', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Order #003', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text('Selesai pada 12 Apr 2026, 10:30', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                          child: const Text('Siap Ambil', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
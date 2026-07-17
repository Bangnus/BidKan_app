import 'package:flutter/material.dart';
import 'package:bidkan/presentation/widgets/common/custom_bottom_nav.dart';
import 'package:bidkan/presentation/screens/Home/home_page.dart';
import 'package:bidkan/presentation/screens/wallet/wallet_page.dart';
import 'package:bidkan/presentation/screens/history/history_page.dart';
import 'package:bidkan/presentation/screens/profile/profile_page.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  // เอาหน้าที่ต้องการสลับมาใส่ใน List นี้
  final List<Widget> _pages = [
    const HomePage(),
    const WalletPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      // 1. IndexedStack จะช่วยสลับหน้าโดยไม่ทำลาย State (เปิดแผนที่ทิ้งไว้ พอกลับมาแผนที่ก็ยังอยู่ตำแหน่งเดิม)
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      // 2. เรียกใช้ CustomBottomNav แค่ที่นี่ที่เดียว!
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        onScanTap: () {
          print('เปิดกล้อง Scan QR!');
        },
      ),
    );
  }
}

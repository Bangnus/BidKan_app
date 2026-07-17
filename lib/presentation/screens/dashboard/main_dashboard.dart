import 'package:flutter/material.dart';
import 'package:bidkan/presentation/widgets/common/custom_bottom_nav.dart';
import 'package:bidkan/presentation/widgets/common/main_top_nav.dart';
import 'package:bidkan/presentation/screens/Home/home_page.dart';
import 'package:bidkan/presentation/screens/wallet/wallet_page.dart';
import 'package:bidkan/presentation/screens/history/history_page.dart';
import 'package:bidkan/presentation/screens/profile/profile_page.dart';
import 'package:bidkan/presentation/screens/scan/qr_scan_page.dart';

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
      // 1. ใช้ Stack เพื่อให้ Top Nav ลอยอยู่เหนือทุกหน้า
      body: Stack(
        children: [
          // เลเยอร์เนื้อหาหลัก (สลับหน้าไปมา)
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          
          // เลเยอร์แถบเมนูด้านบน (แสดงค้างไว้ทุกหน้า ยกเว้นหน้าโปรไฟล์)
          if (_currentIndex != 3)
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: MainTopNav(
                  walletBalance: 100.0,
                  hasNotification: true,
                ),
              ),
            ),
        ],
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QRScanPage()),
          );
        },
      ),
    );
  }
}

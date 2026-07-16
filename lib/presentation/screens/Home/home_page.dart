import 'package:flutter/material.dart';
import 'package:bidkan/presentation/widgets/common/custom_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // ทำให้เนื้อหา (แผนที่) ทะลุลงไปใต้แถบ Bottom Nav ที่ลอยอยู่ได้
      body: Stack(
        children: [
          // 1. เลเยอร์ล่างสุด: พื้นหลัง หรือ แผนที่ จะอยู่ตรงนี้
          const Center(
            child: Text(
              'Welcome to BidKan!',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          
          // 2. เลเยอร์บนสุด: แถบนำทางด้านล่าง (ลอยอยู่)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNav(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              onScanTap: () {
                // TODO: ใส่คำสั่งเปิดกล้องสแกน QR ตรงนี้
                print('Scan QR Tapped!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
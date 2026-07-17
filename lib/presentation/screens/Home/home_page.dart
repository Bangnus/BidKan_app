import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ลบ Scaffold กับ CustomBottomNav ออกไปเลย เหลือแค่ตัวเนื้อหา 
    return const Center(
      child: Text(
        'หน้าแผนที่หลัก (Home)',
        style: TextStyle(
          fontSize: 24, 
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
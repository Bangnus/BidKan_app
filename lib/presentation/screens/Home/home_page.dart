import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. เลเยอร์ล่างสุด: พื้นที่สำหรับใส่แผนที่ในอนาคต
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
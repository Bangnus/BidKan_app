import 'package:flutter/material.dart';
import 'package:bidkan/presentation/screens/Home/widgets/ads.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. เลเยอร์ล่างสุด: พื้นที่สำหรับใส่แผนที่ในอนาคต
        const Center(
          child: Text(
            'หน้าแผนที่หลัก (Home)',
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        
        // 2. เลเยอร์ป้ายโฆษณา (ADS)
        const Positioned(
          top: 90, // เว้นระยะลงมาจากแถบ Top Nav ด้านบน
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: AdsWidget(),
          ),
        ),
      ],
    );
  }
}
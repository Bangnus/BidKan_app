import 'package:flutter/material.dart';
import 'package:bidkan/presentation/screens/Home/widgets/ads.dart';
import 'package:bidkan/presentation/screens/Home/widgets/map.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          // 1. เว้นพื้นที่ด้านบนให้ MainTopNav ที่ลอยอยู่
          const SizedBox(height: 70), 
          
          // 2. ป้ายโฆษณา (ADS)
          const AdsWidget(),
          
          const SizedBox(height: 16), // ระยะห่างระหว่าง ADS กับ แผนที่
          
          // 3. เลเยอร์แผนที่ (แสดงเป็น Card ขอบมน)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: const MapWidget(),
              ),
            ),
          ),
          
          // 4. เว้นพื้นที่ด้านล่างให้ CustomBottomNav ที่ลอยอยู่ (เพิ่มระยะให้ไม่ทับปุ่มแสกน)
          const SizedBox(height: 140),
        ],
      ),
    );
  }
}
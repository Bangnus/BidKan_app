import 'package:flutter/material.dart';
import 'package:bidkan/presentation/screens/Home/widgets/ads.dart';
import 'package:bidkan/presentation/screens/Home/widgets/map.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

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

          const SizedBox(height: 16),

          // 3. แผนที่ใน Card ขอบมน
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: const MapWidget(),
              ),
            ),
          ),

          // 4. เว้นพื้นที่ด้านล่างให้ CustomBottomNav ที่ลอยอยู่
          const SizedBox(height: 140),
        ],
      ),
    );
  }
}

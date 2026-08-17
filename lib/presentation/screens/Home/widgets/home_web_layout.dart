import 'package:flutter/material.dart';
import 'package:bidkan/core/constants/colors.dart';
import 'package:bidkan/presentation/screens/Home/widgets/ads.dart';
import 'package:bidkan/presentation/screens/Home/widgets/map.dart';
import 'package:bidkan/presentation/screens/Home/widgets/nearby_bikes_card.dart';
import 'package:bidkan/presentation/screens/Home/widgets/zone_info_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeWebLayout extends StatelessWidget {
  const HomeWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    const Positioned.fill(child: MapWidget()),
                    _buildCampusBadge(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          const SizedBox(
            width: 360,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdsWidget(),
                  SizedBox(height: 20),
                  NearbyBikesCard(),
                  SizedBox(height: 20),
                  ZoneInfoCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCampusBadge() {
    return Positioned(
      top: 16,
      left: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.92),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2)),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.mapPin, size: 16, color: AppColors.primary),
            SizedBox(width: 6),
            Text('วิทยาเขตหลัก (Main Campus)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}

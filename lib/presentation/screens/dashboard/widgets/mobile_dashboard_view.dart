import 'package:flutter/material.dart';
import 'package:bidkan/presentation/widgets/common/custom_bottom_nav.dart';
import 'package:bidkan/presentation/widgets/common/main_top_nav.dart';
import 'package:bidkan/presentation/screens/scan/qr_scan_page.dart';

class MobileDashboardView extends StatelessWidget {
  final int currentIndex;
  final List<Widget> pages;
  final ValueChanged<int> onTabSelected;

  const MobileDashboardView({
    super.key,
    required this.currentIndex,
    required this.pages,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: pages,
          ),
          if (currentIndex == 0)
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
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: onTabSelected,
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

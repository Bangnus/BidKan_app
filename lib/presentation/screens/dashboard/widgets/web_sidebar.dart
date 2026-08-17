import 'package:flutter/material.dart';
import 'package:bidkan/core/constants/colors.dart';
import 'package:bidkan/presentation/screens/scan/qr_scan_page.dart';
import 'package:bidkan/presentation/screens/dashboard/widgets/sidebar_item.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WebSidebar extends StatelessWidget {
  final int currentIndex;
  final bool isExpanded;
  final ValueChanged<int> onTabSelected;

  const WebSidebar({super.key, required this.currentIndex, required this.isExpanded, required this.onTabSelected});

  static const _menu = [
    {'title': 'หน้าหลัก', 'icon': LucideIcons.home},
    {'title': 'กระเป๋าเงิน', 'icon': LucideIcons.wallet},
    {'title': 'ประวัติการใช้งาน', 'icon': LucideIcons.history},
    {'title': 'โปรไฟล์', 'icon': LucideIcons.user},
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: isExpanded ? 240 : 76,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(2, 0))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogo(),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          const SizedBox(height: 16),
          ...List.generate(
            _menu.length,
            (i) => SidebarItem(
              item: _menu[i],
              isSelected: currentIndex == i,
              isExpanded: isExpanded,
              onTap: () => onTabSelected(i),
            ),
          ),
          const Spacer(),
          _buildQrButton(context),
        ],
      ),
    );
  }

  Widget _buildLogo() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Row(
          mainAxisAlignment: isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/images/lightning.png', width: 34, height: 34, fit: BoxFit.contain),
            if (isExpanded) ...[
              const SizedBox(width: 8),
              const Text('BidKan', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.primary)),
            ],
          ],
        ),
      );

  Widget _buildQrButton(BuildContext context) => Padding(
        padding: const EdgeInsets.all(14.0),
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QRScanPage())),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: EdgeInsets.symmetric(vertical: isExpanded ? 14 : 12, horizontal: isExpanded ? 16 : 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(LucideIcons.qrCode, color: Colors.white, size: 20),
              if (isExpanded) ...[
                const SizedBox(width: 8),
                const Text('สแกนปลดล็อก', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ],
          ),
        ),
      );
}

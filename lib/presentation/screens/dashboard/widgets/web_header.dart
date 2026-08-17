import 'package:flutter/material.dart';
import 'package:bidkan/core/constants/colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WebHeader extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onToggleSidebar;

  const WebHeader({
    super.key,
    required this.currentIndex,
    required this.onToggleSidebar,
  });

  @override
  Widget build(BuildContext context) {
    final titles = ['หน้าหลัก (Campus Map)', 'กระเป๋าเงิน (Wallet)', 'ประวัติการใช้งาน (History)', 'โปรไฟล์ (Profile)'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Hamburger Button
              IconButton(
                onPressed: onToggleSidebar,
                icon: const Icon(LucideIcons.menu, color: AppColors.textPrimary, size: 22),
                tooltip: 'เปิด/ปิด เมนูด้านข้าง',
                style: IconButton.styleFrom(
                  hoverColor: AppColors.primary.withOpacity(0.08),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                titles[currentIndex],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Image.asset('lib/assets/images/coin.png', width: 22, height: 22, fit: BoxFit.contain),
                    const SizedBox(width: 8),
                    const Text('100.0 บาท', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(color: Color(0xFFF3F4F6), shape: BoxShape.circle),
                child: const Icon(LucideIcons.bell, size: 20, color: AppColors.textPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback onScanTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onScanTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF7C3AED); // สีม่วงตามแบรนด์
    final inactiveColor = Colors.grey.shade500;

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      height: 70, // ความสูงของแถบสีขาว
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35), // ทำมุมโค้งมน
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, LucideIcons.home, 'หน้าแรก', primaryColor, inactiveColor),
              _buildNavItem(1, LucideIcons.wallet, 'กระเป๋าเงิน', primaryColor, inactiveColor),
              const SizedBox(width: 70), // เว้นที่ว่างตรงกลางให้ปุ่มแสกน
              _buildNavItem(2, LucideIcons.history, 'ประวัติ', primaryColor, inactiveColor),
              _buildProfileItem(3, 'โปรไฟล์', primaryColor, inactiveColor),
            ],
          ),
          // ปุ่มแสกน QR ตรงกลาง (ลอยขึ้นมา)
          Positioned(
            top: -25, // ดันให้ลอยขึ้นไปเหนือแถบ
            child: GestureDetector(
              onTap: onScanTap,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  LucideIcons.scan, // ไอคอนสแกน
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, Color primary, Color inactive) {
    final isSelected = currentIndex == index;
    final color = isSelected ? primary : inactive;
    
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(int index, String label, Color primary, Color inactive) {
    final isSelected = currentIndex == index;
    final color = isSelected ? primary : inactive;
    
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            // ไอคอนรูปคนชั่วคราว (รอเปลี่ยนเป็นรูปโปรไฟล์จริงทีหลัง)
            child: Icon(LucideIcons.user, size: 16, color: inactive), 
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

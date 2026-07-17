import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:bidkan/core/constants/colors.dart';

class MainTopNav extends StatelessWidget {
  final double walletBalance;
  final bool hasNotification;

  const MainTopNav({
    super.key,
    this.walletBalance = 100.0,
    this.hasNotification = true, // ค่า default มีการแจ้งเตือน
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ซ้าย: ไอคอนสายฟ้า + ข้อความ BidKan
          Row(
            children: [
              Image.asset(
                'lib/assets/images/lightning.png',
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
              // const SizedBox(width: 2),
              const Text(
                'BidKan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white, // ตัวหนังสือสีขาวเพื่อให้ตัดกับพื้นหลังสีม่วง
                ),
              ),
            ],
          ),
          
          const Spacer(), // ดันของที่เหลือไปทางขวา
          
          // ขวา: จำนวนเงินและกระดิ่ง (แยกเป็น 2 ก้อน ระยะห่าง 14px)
          Row(
            children: [
              // 1. ก้อนกระเป๋าเงิน (ทรงแคปซูล)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), // พื้นหลังสีขาว ความเข้ม 50%
                  borderRadius: BorderRadius.circular(50), // โค้งมนสุด (แคปซูล)
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/coin.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      walletBalance.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 14), // ระยะห่าง 14px ตามรูป
              
              // 2. ก้อนกระดิ่งแจ้งเตือน (ทรงวงกลม)
              Container(
                padding: const EdgeInsets.all(8), // ให้พื้นที่รอบกระดิ่งเท่าๆ กันเป็นวงกลม
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      LucideIcons.bell,
                      size: 24,
                      color: AppColors.textPrimary,
                    ),
                    if (hasNotification)
                      Positioned(
                        top: 0,
                        right: 2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF3B30),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bidkan/core/constants/colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NearbyBikesCard extends StatelessWidget {
  const NearbyBikesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bikes = [
      {'id': 'BK-001', 'battery': 85, 'distance': '120 ม.', 'range': '25 กม.', 'isAvailable': true},
      {'id': 'BK-002', 'battery': 42, 'distance': '350 ม.', 'range': '12 กม.', 'isAvailable': false},
      {'id': 'BK-003', 'battery': 95, 'distance': '500 ม.', 'range': '30 กม.', 'isAvailable': true},
    ];

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('🚲 จักรยานรอบตัวคุณ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              Text('3 คัน', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 14),
          ...bikes.map(_buildBikeItem),
        ],
      ),
    );
  }

  Widget _buildBikeItem(Map<String, dynamic> bike) {
    final isAvailable = bike['isAvailable'] as bool;
    final battery = bike['battery'] as int;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isAvailable ? const Color(0xFFE5E7EB) : const Color(0xFFF3F4F6)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (isAvailable ? const Color(0xFF10B981) : const Color(0xFF6B7280)).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(LucideIcons.bike, size: 18, color: isAvailable ? const Color(0xFF10B981) : const Color(0xFF6B7280)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bike['id'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text('🔋 $battery% • วิ่งได้ ${bike['range']} • ห่าง ${bike['distance']}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: (isAvailable ? const Color(0xFF10B981) : Colors.grey).withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              isAvailable ? 'ว่าง' : 'ไม่ว่าง',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isAvailable ? const Color(0xFF059669) : Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}

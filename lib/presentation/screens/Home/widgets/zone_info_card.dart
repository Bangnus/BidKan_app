import 'package:flutter/material.dart';
import 'package:bidkan/core/constants/colors.dart';

class ZoneInfoCard extends StatelessWidget {
  const ZoneInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🅿️ จุดจอดและพื้นที่ให้บริการ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          _buildZoneRow(
            color: Colors.blue,
            title: 'จุดจอด P (Parking Zone)',
            desc: 'จอดคืนจักรยานในจุดนี้เพื่อจบการเดินทาง',
          ),
          const SizedBox(height: 10),
          _buildZoneRow(
            color: Colors.red,
            title: 'เขตจำกัดความเร็ว/พื้นที่ (Limit Zone)',
            desc: 'ห้ามขับขี่ออกนอกเส้นสีแดง ระบบจะตัดไฟอัตโนมัติ',
          ),
        ],
      ),
    );
  }

  Widget _buildZoneRow({
    required Color color,
    required String title,
    required String desc,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

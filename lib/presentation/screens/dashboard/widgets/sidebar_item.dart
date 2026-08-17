import 'package:flutter/material.dart';
import 'package:bidkan/core/constants/colors.dart';

class SidebarItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isSelected;
  final bool isExpanded;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Tooltip(
        message: isExpanded ? '' : (item['title'] as String),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: isExpanded ? 16 : 0, vertical: 12),
            alignment: isExpanded ? Alignment.centerLeft : Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Icon(item['icon'] as IconData, size: 20, color: isSelected ? AppColors.primary : AppColors.textSecondary),
                if (isExpanded) ...[
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      item['title'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? AppColors.primary : AppColors.textPrimary),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

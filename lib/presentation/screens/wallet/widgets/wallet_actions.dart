import 'package:flutter/material.dart';
import 'package:bidkan/core/constants/colors.dart';

class WalletActions extends StatelessWidget {
  final VoidCallback? onTopUp;
  final VoidCallback? onTransfer;
  final VoidCallback? onCoupon;
  final VoidCallback? onRewardRank;

  const WalletActions({
    super.key,
    this.onTopUp,
    this.onTransfer,
    this.onCoupon,
    this.onRewardRank,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _MenuItemData(
        title: 'เติมเงิน',
        iconPath: 'lib/assets/images/wallet_menu/top-up.png',
        onTap: onTopUp,
      ),
      _MenuItemData(
        title: 'โอนเงิน',
        iconPath: 'lib/assets/images/wallet_menu/tranfer.png',
        onTap: onTransfer,
      ),
      _MenuItemData(
        title: 'คูปอง',
        iconPath: 'lib/assets/images/wallet_menu/discount.png',
        onTap: onCoupon,
      ),
      _MenuItemData(
        title: 'รางวัล & แรงค์',
        iconPath: 'lib/assets/images/wallet_menu/rank.png',
        onTap: onRewardRank,
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Expanded(child: _buildItem(item))).toList(),
    );
  }

  Widget _buildItem(_MenuItemData item) {
    return GestureDetector(
      onTap: item.onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ไอคอนเมนู (ขยายเต็มช่องให้รูปชิดติดกันพอดี + คมชัดไม่แตก)
          SizedBox(
            width: double.infinity,
            height: 78,
            child: Image.asset(
              item.iconPath,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
            ),
          ),
          const SizedBox(height: 4),
          // ชื่อเมนู
          Text(
            item.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItemData {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const _MenuItemData({
    required this.title,
    required this.iconPath,
    this.onTap,
  });
}

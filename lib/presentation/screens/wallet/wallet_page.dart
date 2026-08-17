import 'package:flutter/material.dart';
import 'package:bidkan/presentation/screens/wallet/widgets/wallet_card.dart';
import 'package:bidkan/presentation/screens/wallet/widgets/wallet_actions.dart';

class WalletPage extends StatelessWidget {
  /// ยอดเงินที่รอรับจาก API (Default ตัวอย่าง 100.00)
  final double balance;

  /// เลขบัญชีหรือเบอร์โทรศัพท์ที่รอรับจาก API
  final String accountNumber;

  const WalletPage({
    super.key,
    this.balance = 100.00,
    this.accountNumber = '065-458-5254',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. เว้นระยะด้านบนจาก SafeArea
              const SizedBox(height: 24),

              // 2. การ์ดกระเป๋าเงิน (Wallet Card)
              WalletCard(
                accountNumber: accountNumber,
                balance: balance,
              ),

              const SizedBox(height: 24),

              // 3. เมนูหลัก 4 ปุ่ม (เติมเงิน, โอนเงิน, คูปอง, รางวัล & แรงค์)
              WalletActions(
                onTopUp: () {
                  // TODO: นำทางไปหน้าเติมเงิน
                },
                onTransfer: () {
                  // TODO: นำทางไปหน้าโอนเงิน
                },
                onCoupon: () {
                  // TODO: นำทางไปหน้าคูปอง
                },
                onRewardRank: () {
                  // TODO: นำทางไปหน้ารางวัล & แรงค์
                },
              ),

              const SizedBox(height: 24),

              // 4. เว้นพื้นที่ด้านล่างเพื่อไม่ให้โดน CustomBottomNav ทับ
              const SizedBox(height: 140),
            ],
          ),
        ),
      ),
    );
  }
}

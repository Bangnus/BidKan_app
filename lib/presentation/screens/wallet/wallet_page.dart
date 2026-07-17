import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'หน้ากระเป๋าเงิน (Wallet)',
        style: TextStyle(
          fontSize: 24, 
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

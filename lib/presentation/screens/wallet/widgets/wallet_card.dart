import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalletCard extends StatelessWidget {
  /// เลขบัญชี / เบอร์โทรศัพท์ของผู้ใช้งาน (รอรับจาก API)
  final String accountNumber;

  /// ยอดเงินคงเหลือที่ใช้ได้ (รอรับจาก API)
  final double balance;

  /// Callback เมื่อกดคัดลอกเลขบัญชี (หากต้องการ custom logic เพิ่มเติม)
  final VoidCallback? onCopy;

  const WalletCard({
    super.key,
    this.accountNumber = '065-458-5254',
    this.balance = 100.00,
    this.onCopy,
  });

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: accountNumber));
    if (onCopy != null) {
      onCopy!();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('คัดลอกหมายเลข $accountNumber เรียบร้อยแล้ว'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: AspectRatio(
          aspectRatio: 2.00, // สัดส่วนตามภาพ Wallet Card
          child: Stack(
            children: [
              // 1. ภาพพื้นหลังการ์ด (ตัดขอบด้านบนลงมาและตัดขอบรอบนอกทิ้ง)
              Positioned.fill(
                child: Transform.translate(
                  offset: const Offset(0, -3), // ขยับรูปขึ้นด้านบนเพื่อตัดขอบบนลงมาอีก
                  child: Transform.scale(
                    scale: 1.14, // ขยายสเกลเพื่อไม่ให้เกิดช่องว่าง
                    child: Image.asset(
                      'lib/assets/images/wallet card.png',
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, 0.3),
                    ),
                  ),
                ),
              ),

              // 2. เนื้อหาบนการ์ด (เลขบัญชี และ ยอดเงิน)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ส่วนบน: ป้ายเลขบัญชีแบบ Pill Capsule พร้อมปุ่ม Copy
                    GestureDetector(
                      onTap: () => _copyToClipboard(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              accountNumber,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.copy_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30), // ระยะห่างดันยอดเงินขึ้นมาให้ใกล้ป้ายเลขบัญชี

                    // ส่วนล่าง: ยอดเงินที่ใช้ได้ (บาท)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ยอดเงินที่ใช้ได้ (บาท)',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          balance.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

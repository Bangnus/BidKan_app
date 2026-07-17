import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:lucide_icons/lucide_icons.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );
  bool isScanning = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (!isScanning) return;
    
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      final String? code = barcodes.first.rawValue;
      if (code != null) {
        setState(() {
          isScanning = false;
        });
        
        // TODO: นำรหัส QR ไปตรวจสอบกับ Backend ว่าเป็นรถของ BidKan หรือไม่
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('สแกนสำเร็จ!'),
              content: Text('รหัสรถ (Bike ID):\n$code'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // ปิด Dialog
                    setState(() {
                      isScanning = true;
                    });
                  },
                  child: const Text('สแกนใหม่'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // ปิด Dialog
                    Navigator.pop(context); // กลับไปหน้าหลัก
                  },
                  child: const Text('ปลดล็อกรถ'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. กล้องสแกน
          MobileScanner(
            controller: controller,
            onDetect: _onDetect,
          ),
          
          // 2. Overlay สีดำโปร่งแสง พร้อมเจาะรูตรงกลาง
          Container(
            decoration: ShapeDecoration(
              shape: _ScannerOverlayShape(
                borderColor: const Color(0xFF7C3AED), // สีม่วง BidKan
                borderRadius: 12,
                borderLength: 40,
                borderWidth: 8,
                cutOutSize: 280,
              ),
            ),
          ),
          
          // 3. ปุ่มย้อนกลับ
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: const Icon(LucideIcons.arrowLeft, color: Colors.white),
              ),
            ),
          ),
          
          // 4. ข้อความแนะนำการสแกน
          const Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'เล็งกล้องไปที่ QR Code บนตัวรถ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // 5. ปุ่มเปิดไฟฉาย
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (context, state, child) {
                    final torchState = state.torchState;
                    return IconButton(
                      icon: Icon(
                        torchState == TorchState.on ? LucideIcons.flashlight : LucideIcons.flashlightOff,
                        color: torchState == TorchState.on ? Colors.yellow : Colors.white,
                        size: 32,
                      ),
                      onPressed: () => controller.toggleTorch(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------
// Helper Class สำหรับวาด Overlay เจาะรูสแกนเนอร์
// ---------------------------------------------------
class _ScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;

  _ScannerOverlayShape({
    this.borderColor = Colors.red,
    this.borderWidth = 3.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 0.65),
    this.borderRadius = 0,
    this.borderLength = 40,
    this.cutOutSize = 250,
  });

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10.0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }
    return getLeftTopPath(rect)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final height = rect.height;
    final _cutOutSize = cutOutSize;

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final boxPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final cutOutRect = Rect.fromLTWH(
      rect.left + width / 2 - _cutOutSize / 2,
      rect.top + height / 2 - _cutOutSize / 2,
      _cutOutSize,
      _cutOutSize,
    );

    canvas
      ..saveLayer(rect, backgroundPaint)
      ..drawRect(rect, backgroundPaint)
      ..drawRRect(
        RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)),
        boxPaint,
      )
      ..restore();

    // วาดกรอบด้านนอก
    canvas.drawRRect(
      RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)),
      borderPaint,
    );
  }

  @override
  ShapeBorder scale(double t) {
    return _ScannerOverlayShape(
      borderColor: borderColor,
      borderWidth: borderWidth,
      overlayColor: overlayColor,
    );
  }
}

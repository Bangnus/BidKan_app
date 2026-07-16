// ไฟล์: lib/app.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bidkan/presentation/screens/Home/home_page.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidkan',
      debugShowCheckedModeBanner: false,
      
      // 1. ตั้งค่า Theme
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        // สำคัญ: ตั้งให้ Scaffold โปร่งใส เพื่อให้เห็นเลเยอร์ด้านล่างที่เราจัดไว้
        scaffoldBackgroundColor: Colors.transparent, 
      ),

      // 2. ใช้ builder สร้าง เลเยอร์สี F2F2F7 ไว้ล่างสุด และวาง SVG ไว้ด้านบน
      builder: (context, child) {
        return Container(
          color: const Color(0xFFF2F2F7), // สีพื้นหลังหลักของแอป
          child: Stack(
            children: [
              // รูปภาพอยู่แค่ส่วนบน ไม่เต็มหน้าจอ (แต่แสดงรูปครบถ้วน 100%)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'lib/assets/images/bg.png',
                  fit: BoxFit.fitWidth, // ขยายความกว้างเต็มจอ และความสูงปรับตามสัดส่วนจริงของรูป
                ),
              ),
              // ตัวแอป (หน้าจอต่างๆ) จะมาวางทับด้านบน
              if (child != null) child,
            ],
          ),
        );
      },

      // 3. ตั้งค่า Router เปลี่ยนหน้า
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}
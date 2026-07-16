// ไฟล์: lib/main.dart
import 'package:flutter/material.dart';
import 'app.dart'; // import ไฟล์ app.dart เข้ามา

void main() async {
  // บรรทัดนี้จำเป็นมาก! ถ้าเรามีคำสั่ง async ก่อน runApp()
  WidgetsFlutterBinding.ensureInitialized();

  // 🔹 จุดเตรียมความพร้อม (สมมติในอนาคต)
  // await Firebase.initializeApp(); 
  // await LocalStorage.init();

  // เมื่อเครื่องยนต์พร้อมแล้ว ก็สั่งรันแอปพลิเคชัน
  runApp(const Myapp());
}
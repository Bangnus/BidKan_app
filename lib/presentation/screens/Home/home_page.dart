import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ไม่ต้องใส่พื้นหลังแล้ว เพราะจัดการใน app.dart แล้ว
      body: SafeArea(
        child: Center(
          child: Text(
            'Welcome to BidKan!',
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
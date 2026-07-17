import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'หน้าประวัติ (History)',
        style: TextStyle(
          fontSize: 24, 
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

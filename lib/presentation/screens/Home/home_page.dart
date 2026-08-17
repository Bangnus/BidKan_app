import 'package:flutter/material.dart';
import 'package:bidkan/utils/responsive.dart';
import 'package:bidkan/presentation/screens/Home/widgets/home_mobile_layout.dart';
import 'package:bidkan/presentation/screens/Home/widgets/home_web_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isWebOrDesktop(context)) {
      return const HomeWebLayout();
    }
    return const HomeMobileLayout();
  }
}
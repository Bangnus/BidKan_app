import 'package:flutter/material.dart';
import 'package:bidkan/utils/responsive.dart';
import 'package:bidkan/presentation/screens/Home/home_page.dart';
import 'package:bidkan/presentation/screens/wallet/wallet_page.dart';
import 'package:bidkan/presentation/screens/history/history_page.dart';
import 'package:bidkan/presentation/screens/profile/profile_page.dart';
import 'package:bidkan/presentation/screens/dashboard/widgets/mobile_dashboard_view.dart';
import 'package:bidkan/presentation/screens/dashboard/widgets/web_header.dart';
import 'package:bidkan/presentation/screens/dashboard/widgets/web_sidebar.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;
  bool _isSidebarOpen = true;

  final List<Widget> _pages = [
    const HomePage(),
    const WalletPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  void _toggleSidebar() {
    setState(() => _isSidebarOpen = !_isSidebarOpen);
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isWebOrDesktop(context)) {
      return Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        body: Row(
          children: [
            WebSidebar(
              currentIndex: _currentIndex,
              isExpanded: _isSidebarOpen,
              onTabSelected: _onTabSelected,
            ),
            Expanded(
              child: Column(
                children: [
                  WebHeader(
                    currentIndex: _currentIndex,
                    onToggleSidebar: _toggleSidebar,
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: _currentIndex,
                      children: _pages,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return MobileDashboardView(
      currentIndex: _currentIndex,
      pages: _pages,
      onTabSelected: _onTabSelected,
    );
  }
}

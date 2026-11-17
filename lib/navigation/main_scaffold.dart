import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../features/s04_dashboard/presentation/screens/home_dashboard_screen.dart';
import '../features/s08_scanner/presentation/screens/scanner_screen.dart';
import '../features/s11_options_desk/presentation/screens/options_desk_screen.dart';
import '../features/s12_strategy_builder/presentation/screens/strategy_builder_screen.dart';
import '../features/s10_ai_assistant/presentation/screens/ai_assistant_screen.dart';

/// Primary bottom navigation container (Section 3 SOP):
/// Tabs: Home, Scanner, Trade Desk, Algo Lab, and Research
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeDashboardScreen(),
    ScannerScreen(),
    OptionsDeskScreen(),
    StrategyBuilderScreen(),
    AiAssistantScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: AppColors.primaryBullish,
        unselectedItemColor: AppColors.secondaryText,
        backgroundColor: AppColors.surface,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar_outlined),
            activeIcon: Icon(Icons.radar),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.candlestick_chart_outlined),
            activeIcon: Icon(Icons.candlestick_chart),
            label: 'Trade Desk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_outlined),
            activeIcon: Icon(Icons.auto_awesome),
            label: 'Algo Lab',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology_outlined),
            activeIcon: Icon(Icons.psychology),
            label: 'Research',
          ),
        ],
      ),
    );
  }
}

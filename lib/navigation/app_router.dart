import 'package:flutter/material.dart';
import 'main_scaffold.dart';
import '../features/s01_onboarding/presentation/screens/splash_screen.dart';
import '../features/s02_auth/presentation/screens/login_screen.dart';
import '../features/s03_personalization/presentation/screens/personalization_screen.dart';
import '../features/s04_dashboard/presentation/screens/home_dashboard_screen.dart';
import '../features/s05_market_overview/presentation/screens/market_overview_screen.dart';
import '../features/s06_watchlist/presentation/screens/watchlist_screen.dart';
import '../features/s07_charts/presentation/screens/advanced_chart_screen.dart';
import '../features/s08_scanner/presentation/screens/scanner_screen.dart';
import '../features/s09_research/presentation/screens/instrument_research_screen.dart';
import '../features/s10_ai_assistant/presentation/screens/ai_assistant_screen.dart';
import '../features/s11_options_desk/presentation/screens/options_desk_screen.dart';
import '../features/s12_strategy_builder/presentation/screens/strategy_builder_screen.dart';
import '../features/s13_backtest/presentation/screens/backtest_results_screen.dart';
import '../features/s14_paper_terminal/presentation/screens/paper_trading_screen.dart';
import '../features/s15_signals/presentation/screens/signals_feed_screen.dart';
import '../features/s16_portfolio/presentation/screens/portfolio_journal_screen.dart';
import '../features/s17_broker_hub/presentation/screens/broker_hub_screen.dart';
import '../features/s18_alerts/presentation/screens/alerts_screen.dart';
import '../features/s19_billing/presentation/screens/subscription_screen.dart';
import '../features/s20_profile/presentation/screens/profile_screen.dart';
import '../features/s21_admin_console/presentation/screens/admin_console_screen.dart';

class AppRouter {
  AppRouter._();

  static Map<String, WidgetBuilder> get routes => {
    '/': (context) => const SplashScreen(),
    '/login': (context) => const LoginScreen(),
    '/personalization': (context) => const PersonalizationScreen(),
    '/dashboard': (context) => const MainScaffold(),
    '/market_overview': (context) => const MarketOverviewScreen(),
    '/watchlist': (context) => const WatchlistScreen(),
    '/chart': (context) => const AdvancedChartScreen(),
    '/scanner': (context) => const ScannerScreen(),
    '/research': (context) => const InstrumentResearchScreen(),
    '/ai_assistant': (context) => const AiAssistantScreen(),
    '/options': (context) => const OptionsDeskScreen(),
    '/strategy_builder': (context) => const StrategyBuilderScreen(),
    '/backtest_results': (context) => const BacktestResultsScreen(),
    '/paper_terminal': (context) => const PaperTradingScreen(),
    '/signals': (context) => const SignalsFeedScreen(),
    '/portfolio': (context) => const PortfolioJournalScreen(),
    '/broker_hub': (context) => const BrokerHubScreen(),
    '/alerts': (context) => const AlertsScreen(),
    '/subscription': (context) => const SubscriptionScreen(),
    '/profile': (context) => const ProfileScreen(),
    '/admin': (context) => const AdminConsoleScreen(),
  };
}

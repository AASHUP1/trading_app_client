import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'navigation/app_router.dart';

class BoldApp extends StatelessWidget {
  const BoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOLD Trading Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      routes: AppRouter.routes,
    );
  }
}

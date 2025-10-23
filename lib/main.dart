import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/base_page.dart';
import 'constants/portfolio_data.dart';
import 'core/theme/app_theme.dart';
import 'widgets/custom_scaffold.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.name} - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const CustomScaffold(body: BasePage()),
    );
  }
}
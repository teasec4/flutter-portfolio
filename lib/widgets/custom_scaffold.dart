import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/custom_app_bar.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackgroundColor
          : const Color(0xFFF9FAFB),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: body,
          ),
        ),
      ),
    );
  }
}
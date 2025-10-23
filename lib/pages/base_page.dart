import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/content_page.dart';
import '../core/responsive.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: const ContentPage(),
      ),
    );
  }
}
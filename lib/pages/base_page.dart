import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/content_page.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: const ContentPage(),
      ),
    );
  }
}
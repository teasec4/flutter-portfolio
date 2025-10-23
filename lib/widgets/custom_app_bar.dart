import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';
import 'package:portfolio_flutter/widgets/about_sheet.dart';
import '../core/responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 48,
        vertical: isMobile ? 6 : 14,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Max Kovalev',
            style: TextStyle(
              fontSize: isMobile ? 16 : 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const AboutSheet(),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              elevation: 2,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 14 : 24,
                vertical: isMobile ? 8 : 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'About',
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
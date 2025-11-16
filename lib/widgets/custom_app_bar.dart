import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';
import 'package:portfolio_flutter/core/theme/theme_cubit.dart';
import 'package:portfolio_flutter/widgets/about_sheet.dart';
import '../core/responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 48,
        vertical: isMobile ? 6 : 14,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
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
              color: isDark
                  ? AppTheme.darkTextPrimaryColor
                  : Colors.black87,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Theme toggle button
              BlocBuilder<ThemeCubit, bool>(
                builder: (context, isDarkMode) {
                  return SizedBox(
                    width: isMobile ? 40 : 48,
                    height: isMobile ? 40 : 48,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isDarkMode ? Icons.light_mode : Icons.dark_mode,
                        size: isMobile ? 20 : 24,
                        color: isDark
                            ? AppTheme.darkTextPrimaryColor
                            : Colors.black87,
                      ),
                      onPressed: () {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
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
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/responsive.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';

class AboutSheet extends StatelessWidget {
  const AboutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height * (isMobile ? 0.9 : 0.8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurfaceColor : Colors.white,
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.26),
              blurRadius: 16,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            // ---- Scrollable Content ----
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ---- Name ----
                        Text(
                          "Max Kovalev",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppTheme.darkTextPrimaryColor
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),

                        Text(
                          "Flutter & iOS Developer",
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark
                                ? AppTheme.darkTextSecondaryColor
                                : Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ---- About ----
                        Text(
                          "👋 About Me",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppTheme.darkTextPrimaryColor
                                : Colors.grey[900],
                          ),
                        ),
                        const SizedBox(height: 12),

                        Text(
                          "I'm a mobile developer with experience in Flutter and SwiftUI. "
                              "I build modern, elegant apps focused on performance and UX. "
                              "Previously worked in international trade, now fully focused on app development.",
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: isDark
                                ? AppTheme.darkTextSecondaryColor
                                : Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ---- Skills ----
                        Text(
                          "🧠 Skills",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppTheme.darkTextPrimaryColor
                                : Colors.grey[900],
                          ),
                        ),
                        const SizedBox(height: 12),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _skillChip("Flutter", isDark),
                            _skillChip("Dart", isDark),
                            _skillChip("SwiftUI", isDark),
                            _skillChip("Python", isDark),
                            _skillChip("Supabase", isDark),
                            _skillChip("Firebase", isDark),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ---- Close Button ----
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Material(
                color: Colors.transparent,
                child: InkResponse(
                  radius: 28,
                  containedInkWell: true,
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.08)
                          : Colors.black.withValues(alpha: 0.05),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      size: 28,
                      color: isDark
                          ? AppTheme.darkTextPrimaryColor
                          : Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _skillChip(String label, bool isDark) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFF4F46E5)
          .withValues(alpha: isDark ? 0.15 : 0.08),
      labelStyle: const TextStyle(
        color: Color(0xFF4F46E5),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

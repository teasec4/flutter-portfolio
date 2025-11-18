import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_flutter/constants/portfolio_data.dart';
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
                           PortfolioData.aboutBio,
                           style: TextStyle(
                             fontSize: 15,
                             height: 1.6,
                             color: isDark
                                 ? AppTheme.darkTextSecondaryColor
                                 : Colors.black87,
                           ),
                         ),

                        const SizedBox(height: 32),

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
                           children: List.generate(
                             PortfolioData.skills.length,
                             (index) => _skillChip(PortfolioData.skills[index], isDark),
                           ),
                         ),

                        const SizedBox(height: 32),

                        // ---- Social Links ----
                        Text(
                           "🔗 Connect with Me",
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: isDark
                                 ? AppTheme.darkTextPrimaryColor
                                 : Colors.grey[900],
                           ),
                         ),
                         const SizedBox(height: 16),

                         SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                              children: [
                                _socialButton(
                                  icon: FontAwesomeIcons.github,
                                  label: "GitHub",
                                  url: PortfolioData.socialLinks['github']!,
                                  isDark: isDark,
                                ),
                                const SizedBox(width: 12),
                                _socialButton(
                                  icon: FontAwesomeIcons.envelope,
                                  label: "Email",
                                  url: PortfolioData.socialLinks['email']!,
                                  isDark: isDark,
                                ),
                                const SizedBox(width: 12),
                                _socialButton(
                                  icon: FontAwesomeIcons.x,
                                  label: "X",
                                  url: PortfolioData.socialLinks['x']!,
                                  isDark: isDark,
                                ),
                                const SizedBox(width: 12),
                                _socialButton(
                                  icon: FontAwesomeIcons.telegram,
                                  label: "Telegram",
                                  url: PortfolioData.socialLinks['telegram']!,
                                  isDark: isDark,
                                ),
                                const SizedBox(width: 12),
                                _socialButton(
                                  icon: FontAwesomeIcons.weixin,
                                  label: "WeChat",
                                  url: PortfolioData.socialLinks['wechat']!,
                                  isDark: isDark,
                                ),
                              ],
                            ),
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

  Widget _socialButton({
    required IconData icon,
    required String label,
    required String url,
    required bool isDark,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF4F46E5).withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          child: Tooltip(
            message: label,
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF4F46E5),
            ),
          ),
        ),
      ),
    );
  }
}

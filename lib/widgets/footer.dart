import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/responsive.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  static const Map<String, Map<String, String>> socialLinks = {
    'github': {
      'url': 'https://github.com/teasec4',
      'label': 'GitHub',
    },
    'x': {
      'url': 'https://x.com/yourusername',
      'label': 'X',
    },
    'telegram': {
      'url': 'https://t.me/yourusername',
      'label': 'Telegram',
    },
  };

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: isMobile ? 16 : 32,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark
                ? Colors.grey[800]!
                : Colors.grey[200]!,
          ),
        ),
      ),
      child: Column(
        children: [
          // Social buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: socialLinks.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _SocialButton(
                  label: entry.value['label']!,
                  url: entry.value['url']!,
                  onTap: () => _launchURL(entry.value['url']!),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          // Copyright
          Text(
            '© 2024. Built with Flutter',
            style: TextStyle(
              fontSize: 12,
              color: isDark
                  ? AppTheme.darkTextSecondaryColor
                  : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final String label;
  final String url;
  final VoidCallback onTap;

  const _SocialButton({
    required this.label,
    required this.url,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered
                ? (isDark
                    ? Colors.grey[700]
                    : Colors.grey[100])
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered
                  ? (isDark
                      ? Colors.grey[600]!
                      : Colors.grey[300]!)
                  : (isDark
                      ? Colors.grey[700]!
                      : Colors.grey[200]!),
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isDark
                  ? AppTheme.darkTextPrimaryColor
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

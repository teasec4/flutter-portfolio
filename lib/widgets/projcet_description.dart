import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/core/responsive.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';
import 'package:portfolio_flutter/widgets/action_button.dart';
import 'package:portfolio_flutter/widgets/project_preview.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectDescription extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final List<String> technologies;
  final String? link;
  final String gifPath;

  const ProjectDescription({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.technologies,
    this.link,
    required this.gifPath,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isExtraSmall = Responsive.isExtraSmall(context);
    final isLargeMobile = Responsive.isLargeMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: isExtraSmall ? 8 : (isMobile ? 10 : 32),
          horizontal: isExtraSmall ? 8 : (isMobile ? 10 : 28),
        ),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurfaceColor : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: isDark
                ? Colors.grey[700]!.withValues(alpha: 0.3)
                : Colors.grey.withValues(alpha: 0.1),
          ),
        ),
        child: ConstrainedBox(
           constraints: BoxConstraints(
             maxWidth: isMobile ? double.infinity : 500,
           ),
           child: Column(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ---- Title ----
              Text(
                title,
                style: TextStyle(
                  fontSize: isExtraSmall 
                      ? 20 
                      : (isLargeMobile ? 30 : (isMobile ? 26 : 32)),
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppTheme.darkTextPrimaryColor
                      : Colors.black87,
                  height: 1.1,
                ),
              ),
              SizedBox(height: isExtraSmall ? 6 : (isLargeMobile ? 14 : (isMobile ? 10 : 20))),

              // ---- Subtitle ----
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isExtraSmall 
                      ? 13 
                      : (isLargeMobile ? 17 : (isMobile ? 16 : 18)),
                  color: isDark
                      ? AppTheme.darkTextSecondaryColor
                      : Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: isExtraSmall ? 6 : (isLargeMobile ? 14 : (isMobile ? 10 : 20))),

              // ---- Description ----
              if (!isMobile)
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark
                        ? AppTheme.darkTextSecondaryColor
                        : Colors.grey[800],
                    height: 1.6,
                  ),
                )
              else
                const SizedBox(height: 0),
              SizedBox(height: isMobile ? 0 : 20),
              // ---- Tech stack ----
              Wrap(
                spacing: isExtraSmall ? 6 : (isLargeMobile ? 10 : 10),
                runSpacing: isExtraSmall ? 6 : (isLargeMobile ? 10 : 10),
                children: technologies
                    .take(isExtraSmall ? 3 : 999)
                    .map(
                      (tech) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isExtraSmall ? 8 : (isLargeMobile ? 14 : 12),
                      vertical: isExtraSmall ? 4 : (isLargeMobile ? 8 : 6),
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFF4F46E5).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(isExtraSmall ? 8 : (isLargeMobile ? 14 : 12)),
                        border: Border.all(
                          color: const Color(0xFF4F46E5).withValues(alpha: 0.2),
                        ),
                      ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        color: const Color(0xFF4F46E5),
                        fontWeight: FontWeight.w600,
                        fontSize: isExtraSmall ? 11 : (isLargeMobile ? 14 : 13),
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),

               SizedBox(height: isExtraSmall ? 8 : (isLargeMobile ? 14 : (isMobile ? 10 : 20))),
               // ---- Action buttons ----
               if (isExtraSmall)
                 // Vertical layout for extra small screens
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     if (link != null)
                       SizedBox(
                         width: double.infinity,
                         child: _CompactActionButton(
                           color: const Color(0xFF4F46E5),
                           icon: Icons.code,
                           label: "GitHub",
                           textColor: Colors.white,
                           isCopyButton: true,
                           copyText: link,
                           isLarge: isLargeMobile,
                           onTap: () async {
                             if (await canLaunchUrlString(link!)) {
                               await launchUrlString(link!,
                                   mode: LaunchMode.externalApplication);
                             }
                           },
                         ),
                       ),
                     if (link != null) SizedBox(height: isLargeMobile ? 10 : 8),
                     SizedBox(
                       width: double.infinity,
                       child: _CompactActionButton(
                         color: Colors.grey[200]!,
                         icon: Icons.video_collection,
                         label: "Preview",
                         textColor: Colors.black87,
                         isLarge: isLargeMobile,
                         onTap: () => {
                           showModalBottomSheet(
                             context: context,
                             isScrollControlled: true,
                             backgroundColor: Colors.transparent,
                             builder: (_) =>  ProjectPreview(path: gifPath,),
                           )
                         }
                       ),
                     ),
                   ],
                 )
               else
                 // Horizontal layout for larger screens
                 Wrap(
                   spacing: isLargeMobile ? 12 : (isMobile ? 8 : 12),
                   runSpacing: 10,
                   children: [
                     if (link != null)
                       // --- GitHub Button ---
                       ActionButton(
                         color: const Color(0xFF4F46E5),
                         icon: Icons.code,
                         label: "GitHub",
                         textColor: Colors.white,
                         isCopyButton: true,
                         copyText: link,
                         onTap: () async {
                           if (await canLaunchUrlString(link!)) {
                             await launchUrlString(link!,
                                 mode: LaunchMode.externalApplication);
                           }
                         },
                       ),
                     // --- View Details Button ---
                     ActionButton(
                       color: Colors.grey[200]!,
                       icon: Icons.video_collection,
                       label: "Preview",
                       textColor: Colors.black87,
                       onTap: () => {
                         showModalBottomSheet(
                           context: context,
                           isScrollControlled: true,
                           backgroundColor: Colors.transparent,
                           builder: (_) =>  ProjectPreview(path: gifPath,),
                         )
                       }
                     ),
                   ],
                 ),
            ],
          ),
        ),
      ),
    );
  }
}

// Compact button for extra small screens
class _CompactActionButton extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String label;
  final Color textColor;
  final VoidCallback onTap;
  final bool isCopyButton;
  final String? copyText;
  final bool isLarge;

  const _CompactActionButton({
    required this.color,
    required this.icon,
    required this.label,
    required this.textColor,
    required this.onTap,
    this.isCopyButton = false,
    this.copyText,
    this.isLarge = false,
  });

  @override
  State<_CompactActionButton> createState() => _CompactActionButtonState();
}

class _CompactActionButtonState extends State<_CompactActionButton> {
  bool _isCopied = false;

  void _handleTap() async {
    if (widget.isCopyButton && widget.copyText != null) {
      await Clipboard.setData(ClipboardData(text: widget.copyText!));
      if (!mounted) return;

      setState(() => _isCopied = true);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Copied!'),
          duration: const Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) setState(() => _isCopied = false);
      });
    } else {
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: widget.isLarge ? 14 : 10,
          vertical: widget.isLarge ? 10 : 8,
        ),
        decoration: BoxDecoration(
          color: _isCopied ? widget.color.withValues(alpha: 0.8) : widget.color,
          borderRadius: BorderRadius.circular(widget.isLarge ? 10 : 8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isCopied && widget.isCopyButton ? Icons.check : widget.icon,
              color: widget.textColor,
              size: widget.isLarge ? 16 : 14,
            ),
            const SizedBox(width: 4),
            Text(
              _isCopied && widget.isCopyButton ? 'Copied!' : widget.label,
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.w600,
                fontSize: widget.isLarge ? 13 : 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
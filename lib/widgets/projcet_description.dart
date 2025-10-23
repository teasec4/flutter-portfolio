import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/responsive.dart';
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

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 10 : 32,
          horizontal: isMobile ? 10 : 28,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
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
                  fontSize: isMobile ? 26 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.2,
                ),
              ),
            SizedBox(height: isMobile ? 10 : 20),

              // ---- Subtitle ----
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),

            SizedBox(height: isMobile ? 10 : 20),

              // ---- Description ----
              if (!isMobile)
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    height: 1.6,
                  ),
                )
              else
                const SizedBox(height: 0),
              SizedBox(height: isMobile ? 0 : 20),
              // ---- Tech stack ----
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: technologies
                    .map(
                      (tech) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F46E5).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF4F46E5).withOpacity(0.2),
                      ),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        color: Color(0xFF4F46E5),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),

               SizedBox(height: isMobile ? 10 : 20),
              // ---- Action buttons ----
              if (link != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // --- GitHub Button ---
                    ActionButton(
                      color: const Color(0xFF4F46E5),
                      icon: Icons.code,
                      label: "GitHub",
                      textColor: Colors.white,
                      onTap: () async {
                        if (await canLaunchUrlString(link!)) {
                          await launchUrlString(link!,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    ),
                    const SizedBox(width: 12),
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
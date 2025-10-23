import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/responsive.dart';

class AboutSheet extends StatelessWidget {
  const AboutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SafeArea(
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height * (isMobile ? 0.9 : 0.8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 16,
              offset: Offset(0, -2),
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
                        const Text(
                          "Max Kovalev",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),

                        Text(
                          "Flutter & iOS Developer",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
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
                            color: Colors.grey[900],
                          ),
                        ),
                        const SizedBox(height: 12),

                        const Text(
                          "I’m a mobile developer with experience in Flutter and SwiftUI. "
                              "I build modern, elegant apps focused on performance and UX. "
                              "Previously worked in international trade, now fully focused on app development.",
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ---- Skills ----
                        Text(
                          "🧠 Skills",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                          ),
                        ),
                        const SizedBox(height: 12),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _skillChip("Flutter"),
                            _skillChip("Dart"),
                            _skillChip("SwiftUI"),
                            _skillChip("Python"),
                            _skillChip("Supabase"),
                            _skillChip("Firebase"),
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
                      color: Colors.black.withOpacity(0.05),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 28,
                      color: Colors.black87,
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

  Widget _skillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFF4F46E5).withOpacity(0.08),
      labelStyle: const TextStyle(
        color: Color(0xFF4F46E5),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
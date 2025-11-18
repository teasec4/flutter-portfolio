import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/portfolio_data.dart';
import 'package:portfolio_flutter/core/responsive.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';
import 'package:portfolio_flutter/widgets/adaptive_image.dart';
import 'package:portfolio_flutter/widgets/projcet_description.dart';
import 'package:portfolio_flutter/widgets/footer.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final projects = PortfolioData.projects;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ---------- PROJECTS SLIDER ----------
          SizedBox(
          height: isMobile ? screenHeight * 0.82 : screenHeight * 0.8,
          child: Stack(
            children: [
              // ---- PageView ----
              PageView.builder(
                controller: _controller,
                itemCount: projects.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      if (!_controller.hasClients ||
                          !_controller.position.haveDimensions) {
                        return child!;
                      }

                      final currentPage = (_controller.page ??
                          _controller.initialPage.toDouble());
                      final distance = (currentPage - index).abs();
                      final scale = (1 - distance * 0.3).clamp(0.7, 1.0);
                      final opacity = scale;

                      return Opacity(
                        opacity: opacity,
                        child: Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flex(
                        direction: isMobile ? Axis.vertical : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: isMobile ? 5 : 6,
                            child: AdaptiveImage(
                              assetPath: project.imageUrl.toString(),
                            ),
                          ),
                          SizedBox(
                              height: isMobile ? 5 : 0,
                              width: isMobile ? 0 : 40),
                          Flexible(
                            flex: isMobile ? 6 : 5,
                            child: ProjectDescription(
                              title: project.title,
                              subtitle: project.description,
                              description: project.detailedDescription,
                              technologies: project.technologies,
                              link: project.githubUrl,
                              gifPath: project.gifUrl.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              // ---- Left arrow (Desktop only) ----
              if (!isMobile && _currentPage > 0)
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _arrowButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),

              // ---- Right arrow (Desktop only) ----
              if (!isMobile && _currentPage < projects.length - 1)
                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _arrowButton(
                      icon: Icons.arrow_forward_ios,
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ---------- PAGE INDICATORS ----------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            projects.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.all(6),
              width: _currentPage == index ? 24 : 12,
              height: 12,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppTheme.primaryColor
                    : Colors.grey[400],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        
        // ---------- FOOTER ----------
        const Footer(),
        ],
        ),
        );
        }

  Widget _arrowButton({required IconData icon, required VoidCallback onTap}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: isDark ? Colors.grey[300] : Colors.black87,
          size: 22,
        ),
      ),
    );
  }
}
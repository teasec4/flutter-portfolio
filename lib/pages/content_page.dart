import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/portfolio_data.dart';
import 'package:portfolio_flutter/core/responsive.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';
import 'package:portfolio_flutter/widgets/adaptive_image.dart';
import 'package:portfolio_flutter/widgets/projcet_description.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool _isLoading = true;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadAssets();
    });
  }

  Future<void> _preloadAssets() async {
    final projects = PortfolioData.projects;
    final total = projects.length;
    int loaded = 0;

    for (final project in projects) {
      final image = AssetImage(project.imageUrl.toString());
      try {
        await precacheImage(image, context)
            .timeout(const Duration(seconds: 5), onTimeout: () {});
      } catch (e) {
        debugPrint("⚠️ Error preloading ${project.imageUrl}: $e");
      }

      loaded++;
      setState(() {
        _progress = loaded / total;
      });
    }

    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: _buildLoadingScreen());
    }

    final isMobile = Responsive.isMobile(context);
    final projects = PortfolioData.projects;
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: _isLoading ? 0 : 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ---------- PROJECTS SLIDER ----------
          SizedBox(
            height: isMobile
                ? screenHeight * 0.82
                : screenHeight  * 0.8,
            child: PageView.builder(
              controller: _controller,
              itemCount: projects.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final project = projects[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: isMobile ? 5 : 6,
                        child: AdaptiveImage(assetPath: project.imageUrl.toString()),
                      ),
                       SizedBox(height: isMobile ? 5 : 0, width: isMobile ? 0 :  40),
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
                );
              },
            ),
          ),

           SizedBox(height: isMobile ? 2 : 16),

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
        ],
      ),
    );
  }

  Widget _buildLoadingScreen() {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Loading projects...',
            style: TextStyle(
              fontSize: 18,
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 180,
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[200],
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(12),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${(_progress * 100).round()}%',
            style: const TextStyle(color: AppTheme.primaryColor),
          ),
        ],
      ),
    );
  }
}
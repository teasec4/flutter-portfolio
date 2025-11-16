import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/responsive.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';

class ProjectPreview extends StatefulWidget {
  final String path;

  const ProjectPreview({super.key, required this.path});

  @override
  State<ProjectPreview> createState() => _ProjectPreviewState();
}

class _ProjectPreviewState extends State<ProjectPreview> {
  late ImageStream _imageStream;
  late ImageStreamListener _imageListener;
  bool _isLoaded = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadGif();
  }

  void _loadGif() {
    final assetImage = AssetImage(widget.path);
    _imageStream = assetImage.resolve(const ImageConfiguration());

    _imageListener = ImageStreamListener(
      (image, synchronousCall) {
        if (mounted) {
          setState(() {
            _isLoaded = true;
            _hasError = false;
          });
        }
      },
      onError: (dynamic error, StackTrace? stackTrace) {
        if (mounted) {
          setState(() {
            _isLoaded = true;
            _hasError = true;
          });
        }
        debugPrint('Error loading GIF ${widget.path}: $error');
      },
    );

    _imageStream.addListener(_imageListener);
  }

  @override
  void dispose() {
    _imageStream.removeListener(_imageListener);
    super.dispose();
  }

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
          color: isDark ? AppTheme.darkSurfaceColor : Colors.black,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Center(
                child: !_isLoaded
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Loading preview...',
                            style: TextStyle(
                              color: isDark
                                  ? AppTheme.darkTextPrimaryColor
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    : _hasError
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_not_supported_outlined,
                                size: 48,
                                color: isDark
                                    ? Colors.grey[400]
                                    : Colors.grey[300],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Failed to load preview',
                                style: TextStyle(
                                  color: isDark
                                      ? Colors.grey[400]
                                      : Colors.grey[300],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        : AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: _isLoaded && !_hasError ? 1.0 : 0.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                widget.path,
                                fit: BoxFit.contain,
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
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 28,
                      color: Colors.white,
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
    }

import 'package:flutter/material.dart';

class AdaptiveImage extends StatefulWidget {
  final String assetPath;
  final BoxFit fit;

  const AdaptiveImage({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.contain,
  });

  @override
  State<AdaptiveImage> createState() => _AdaptiveImageState();
}

class _AdaptiveImageState extends State<AdaptiveImage>
    with AutomaticKeepAliveClientMixin {
  late ImageStream _imageStream;
  late ImageStreamListener _imageListener;
  bool _isLoaded = false;
  bool _hasError = false;
  double? _aspectRatio;

  @override
  bool get wantKeepAlive => _isLoaded;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() {
    final assetImage = AssetImage(widget.assetPath);
    _imageStream = assetImage.resolve(const ImageConfiguration());

    _imageListener = ImageStreamListener(
      (image, synchronousCall) {
        if (mounted) {
          setState(() {
            _isLoaded = true;
            _hasError = false;
            _aspectRatio = image.image.width / image.image.height;
          });
        }
      },
      onChunk: (ImageChunkEvent event) {
        // Can be used for progress indication if needed
      },
      onError: (dynamic error, StackTrace? stackTrace) {
        if (mounted) {
          setState(() {
            _isLoaded = true;
            _hasError = true;
          });
        }
        debugPrint('Error loading image ${widget.assetPath}: $error');
      },
    );

    _imageStream.addListener(_imageListener);
  }

  @override
  void didUpdateWidget(AdaptiveImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      _imageStream.removeListener(_imageListener);
      setState(() {
        _isLoaded = false;
        _hasError = false;
        _aspectRatio = null;
      });
      _loadImage();
    }
  }

  @override
  void dispose() {
    _imageStream.removeListener(_imageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final aspect = _aspectRatio ?? 1.0;

    return AspectRatio(
      aspectRatio: aspect,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            // Skeleton/Loading background
            Container(
              color: isDark
                  ? Colors.grey[800]
                  : Colors.grey[200],
            ),

            // Error state
            if (_hasError)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_not_supported_outlined,
                    size: 48,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Failed to load image',
                    style: TextStyle(
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            else
              // Loading skeleton animation
              if (!_isLoaded)
                Container(
                  color: isDark
                      ? Colors.grey[800]?.withValues(alpha: 0.5)
                      : Colors.grey[200]?.withValues(alpha: 0.5),
                  child: Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                )
              else
                // Loaded image
                AnimatedOpacity(
                  opacity: _isLoaded && !_hasError ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                  child: Image.asset(
                    widget.assetPath,
                    fit: widget.fit,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AdaptiveImage extends StatefulWidget {
  final String assetPath;

  const AdaptiveImage({super.key, required this.assetPath});

  @override
  State<AdaptiveImage> createState() => _AdaptiveImageState();
}

class _AdaptiveImageState extends State<AdaptiveImage> {
  bool _isLoaded = false;
  late final Image _image;
  double? _aspectRatio;

  @override
  void initState() {
    super.initState();

    _image = Image.asset(
      widget.assetPath,
      fit: BoxFit.contain,
    );

    final stream = _image.image.resolve(const ImageConfiguration());
    stream.addListener(
      ImageStreamListener(
            (info, _) {
          if (mounted) {
            setState(() {
              _isLoaded = true;
              _aspectRatio = info.image.width / info.image.height;
            });
          }
        },
        onError: (error, _) => debugPrint("Error loading image: $error"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final aspect = _aspectRatio ?? 1.0;

    return AspectRatio(
      aspectRatio: aspect,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Container(color: Colors.grey[200]),
            AnimatedOpacity(
              opacity: _isLoaded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOutCubic,
              child: _image,
            ),
          ],
        ),
      ),
    );
  }
}
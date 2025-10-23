import 'package:flutter/material.dart';

class AdaptiveImage extends StatelessWidget {
  final String assetPath;

  const AdaptiveImage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [

              Positioned.fill(
                child: Container(
                  color: Colors.grey[200],
                ),
              ),


              Image.asset(
                assetPath,
                fit: BoxFit.contain,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    child: child,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
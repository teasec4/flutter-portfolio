import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/responsive.dart';

class ProjectPreview extends StatefulWidget {
  final String path;

  const ProjectPreview({super.key, required this.path});

  @override
  State<ProjectPreview> createState() => _ProjectPreviewState();
}

class _ProjectPreviewState extends State<ProjectPreview>{
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _preloadGif();
  }

  Future<void> _preloadGif() async {
    final image = AssetImage(widget.path);

    try {
      await precacheImage(image, context);
    } catch (e) {
      debugPrint("⚠️ Error preloading gif: $e");
    }

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);


    return  SafeArea(
      top: false,
      child: Container(

        height: MediaQuery.of(context).size.height * (isMobile ? 0.9 : 0.8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
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
              Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                child: Center(
                  child: _isLoading
                      ? Container(
                    color: Colors.black,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Colors.white),
                          SizedBox(height: 20),
                          Text(
                            'Loading preview...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                      : AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _isLoading ? 0 : 1,
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
                      color: Colors.white.withOpacity(0.1),
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

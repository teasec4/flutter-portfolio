import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/theme/app_theme.dart';

class ActionButton extends StatefulWidget {
  final Color color;
  final Color accentColor;
  final IconData icon;
  final String label;
  final Color textColor;
  final VoidCallback onTap;
  final bool pulse;

  const ActionButton({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.textColor,
    required this.onTap,
    this.accentColor = Colors.white,
    this.pulse = false,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _scale;
  late final Animation<Color?> _colorAnim;
  late final Animation<Color?> _textColorAnim;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scale = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _c, curve: Curves.easeInOut),
    );

    // 🎨 Анимация цвета фона
    _colorAnim = ColorTween(
      begin: widget.color,
      end: widget.accentColor,
    ).animate(
      CurvedAnimation(parent: _c, curve: Curves.easeInOut),
    );

    // 🩵 Анимация цвета текста
    _textColorAnim = ColorTween(
      begin: widget.textColor,
      end: widget.accentColor,
    ).animate(
      CurvedAnimation(parent: _c, curve: Curves.easeInOut),
    );

    if (widget.pulse) _c.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(covariant ActionButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pulse != widget.pulse) {
      widget.pulse ? _c.repeat(reverse: true) : _c.stop();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        final currentColor = _colorAnim.value ?? widget.color;
        final currentTextColor = _textColorAnim.value ?? widget.textColor;

        return Transform.scale(
          scale: widget.pulse ? _scale.value : 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: currentColor.withOpacity(widget.pulse ? 0.6 : 0.2),
                  blurRadius: widget.pulse ? 30 : 10,
                  spreadRadius: widget.pulse ? 1.3 : 0,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: _buildButton(currentTextColor),
          ),
        );
      },
    );
  }

  Widget _buildButton(Color currentTextColor) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: currentTextColor, size: 20),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: currentTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
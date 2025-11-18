import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActionButton extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String label;
  final Color textColor;
  final VoidCallback onTap;
  final bool isCopyButton;
  final String? copyText;

  const ActionButton({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.textColor,
    required this.onTap,
    this.isCopyButton = false,
    this.copyText,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool _isCopied = false;

  void _handleTap() async {
    if (widget.isCopyButton && widget.copyText != null) {
      await Clipboard.setData(ClipboardData(text: widget.copyText!));
      if (!mounted) return;
      
      setState(() => _isCopied = true);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Copied to clipboard!'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) setState(() => _isCopied = false);
      });
    } else {
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: _isCopied ? widget.color.withValues(alpha: 0.8) : widget.color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isCopied && widget.isCopyButton ? Icons.check : widget.icon,
                color: widget.textColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                _isCopied && widget.isCopyButton ? 'Copied!' : widget.label,
                style: TextStyle(
                  color: widget.textColor,
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
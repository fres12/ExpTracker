import 'package:flutter/material.dart';

class HoverableTile extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final VoidCallback onTap;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  const HoverableTile({
    required this.padding,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  _HoverableTileState createState() => _HoverableTileState();
}

class _HoverableTileState extends State<HoverableTile> {
  bool _isTapped = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isTapped = true);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isTapped = false);
    widget.onTap();
  }

  void _handleTapCancel() {
    setState(() => _isTapped = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150), // Percepat animasi
        padding: widget.padding,
        decoration: BoxDecoration(
          color: _isTapped ? Colors.grey[300] : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: _isTapped
              ? [BoxShadow(color: Colors.grey.withOpacity(0.5))]
              : [],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.title,
                  widget.subtitle,
                ],
              ),
            ),
            widget.trailing,
          ],
        ),
      ),
    );
  }
}

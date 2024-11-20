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

  void _handleTap() {
    setState(() => _isTapped = true);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() => _isTapped = false);
      }
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: _isTapped ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
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

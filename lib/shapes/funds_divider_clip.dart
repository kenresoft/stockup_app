import 'package:flutter/material.dart';

class FundsDividerClip extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeMiterLimit = 20
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(0, top)
      ..lineTo(width / 4, top)
      ..lineTo((width / 4) + 40, 0)
      ..lineTo((3 * width / 4) - 40, 0)
      ..lineTo((3 * width / 4), top)
      ..lineTo(width, top);

    canvas.drawPath(path, paint);
  }

  double get top => 20;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

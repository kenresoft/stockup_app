import 'package:flutter/material.dart';

class PortfolioClip2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width - 10;
    final height = size.height - 10;

    final paint = Paint()
      //..color = const Color(0xff2B2B2B)
      ..color = const Color(0xff83CCFB)
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 20)
      /// Top Left
      ..addRRect(RRect.fromLTRBR(0, 0, width, height, const Radius.circular(20)));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

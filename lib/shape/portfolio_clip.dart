import 'package:flutter/material.dart';

class PortfolioClip extends CustomPainter {
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
      ..arcToPoint(const Offset(20, 0), radius: const Radius.circular(20))
      ..lineTo((width / 4) + 30, 0)
      ..arcToPoint(Offset((width / 4) + 45, 10), radius: const Radius.circular(15))
      ..arcToPoint(Offset((width / 4) + 60, 20), radius: const Radius.circular(15), clockwise: false)
      ..lineTo((3 * width / 4) - 65, 20)
      ..arcToPoint(Offset((3 * width / 4) - 45, 10), radius: const Radius.circular(20), clockwise: false)
      ..arcToPoint(Offset((3 * width / 4) - 25, 0), radius: const Radius.circular(20))
      /// Top Right
      ..lineTo(width - 20, 0)
      ..arcToPoint(Offset(width, 20), radius: const Radius.circular(20))
      ..lineTo(width, height - 20)
      ..arcToPoint(Offset(width - 20, height), radius: const Radius.circular(20))
      /// Bottom Right
      ..lineTo((3 * width / 4) - 10, height)
      ..arcToPoint(Offset((3 * width / 4) - 40, height - 20), radius: const Radius.circular(35))
      ..arcToPoint(Offset((3 * width / 4) - 70, height - 40), radius: const Radius.circular(35), clockwise: false)
      ..lineTo((width / 4) + 70, height - 40)
      ..arcToPoint(Offset((width / 4) + 40, height - 20), radius: const Radius.circular(35), clockwise: false)
      ..arcToPoint(Offset((width / 4) + 10, height - 0), radius: const Radius.circular(35))
      /// Bottom Left
      ..lineTo(20, height)
      ..arcToPoint(Offset(0, height - 20), radius: const Radius.circular(20))
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

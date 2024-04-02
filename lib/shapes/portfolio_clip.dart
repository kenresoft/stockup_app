import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioClip extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..color = const Color(0xff83CCFB)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 20.h)

      /// Top Left
      ..arcToPoint(Offset(20.w, 0), radius: const Radius.circular(20).r)
      ..lineTo((width / 4) + 30.w, 0)
      ..arcToPoint(Offset((width / 4) + 45.w, 10.h), radius: const Radius.circular(15).r)
      ..arcToPoint(Offset((width / 4) + 60.w, 20.h), radius: const Radius.circular(15), clockwise: false)
      ..lineTo((3 * width / 4) - 65.w, 20.h)
      ..arcToPoint(Offset((3 * width / 4) - 45.w, 10.h), radius: const Radius.circular(20).r, clockwise: false)
      ..arcToPoint(Offset((3 * width / 4) - 25.w, 0), radius: const Radius.circular(20).r)

      /// Top Right
      ..lineTo(width - 20.w, 0)
      ..arcToPoint(Offset(width, 20.h), radius: const Radius.circular(20).r)
      ..lineTo(width, height - 20.h)
      ..arcToPoint(Offset(width - 20.w, height), radius: const Radius.circular(20).r)

      /// Bottom Right
      ..lineTo((3 * width / 4) - 10.w, height)
      ..arcToPoint(Offset((3 * width / 4) - 40.w, height - 20.h), radius: const Radius.circular(35).r)
      ..arcToPoint(Offset((3 * width / 4) - 70.w, height - 40.h), radius: const Radius.circular(35).r, clockwise: false)
      ..lineTo((width / 4) + 70.w, height - 40.h)
      ..arcToPoint(Offset((width / 4) + 40.w, height - 20.h), radius: const Radius.circular(35).r, clockwise: false)
      ..arcToPoint(Offset((width / 4) + 10.w, height - 0), radius: const Radius.circular(35).r)

      /// Bottom Left
      ..lineTo(20.w, height)
      ..arcToPoint(Offset(0, height - 20.h), radius: const Radius.circular(20).r)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

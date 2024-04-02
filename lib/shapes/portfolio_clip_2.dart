import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioSwitchClip extends CustomPainter {
  const PortfolioSwitchClip({required this.currentIndex});

  final int currentIndex;
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..color = const Color(0xff414141)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path()

      /// left box
      ..moveTo(20.w, 0)
      ..lineTo((width / 2) - 30.w, 0)

      /// top curve
      ..arcToPoint(Offset((width / 2) - 10.w, 10.h), radius: const Radius.circular(25).r)
      ..quadraticBezierTo(
        (width / 2),
        (height / 2) + 0,
        (width / 2) + 10.w,
        10.h,
      )
      ..arcToPoint(Offset((width / 2) + 30.w, 0), radius: const Radius.circular(25).r)

      /// right box
      ..lineTo(width - 20.w, 0)
      ..arcToPoint(Offset(width - 20.w, height), radius: const Radius.circular(25).r)

      /// right box
      ..lineTo((width / 2) + 30.w, height)

      /// bottom curve
      ..arcToPoint(Offset((width / 2) + 10.w, height - 10.h), radius: const Radius.circular(25).r)
      ..quadraticBezierTo(
        (width / 2),
        (height / 2) - 0,
        (width / 2) - 10.w,
        height - 10.h,
      )
      ..arcToPoint(Offset((width / 2) - 30.w, height), radius: const Radius.circular(25).r)

      /// left box

      ..lineTo(20.w, height)
      ..arcToPoint(Offset(20.w, 0), radius: const Radius.circular(25).r);

    /// draw fill
    canvas.drawPath(path, paint);

    /// draw outline
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = const Color(0xff333333),
    );

    currentIndex == 0
        ? canvas.drawPath(
            Path()
              ..moveTo(20.w, 0)
              ..lineTo((width / 2) - 30.w, 0)
              ..arcToPoint(Offset((width / 2) - 30.w, height), radius: const Radius.circular(25).r)
              ..lineTo(20.w, height)
              ..arcToPoint( Offset(20.w, 0), radius: const Radius.circular(25).r),
            paint..color = const Color(0xff83CCFB),
          )
        : canvas.drawPath(
            Path()
              ..moveTo((width / 2) + 30.w, 0)
              ..lineTo(width - 20.w, 0)
              ..arcToPoint(Offset(width - 20.w, height), radius: const Radius.circular(25).r)
              ..lineTo((width / 2) + 30.w, height)
              ..arcToPoint(Offset((width / 2) + 30.w, 0), radius: const Radius.circular(25).r),
            paint..color = const Color(0xff83CCFB),
          );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
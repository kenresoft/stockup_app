import 'package:flutter/material.dart';

class PortfolioClip2 extends CustomPainter {
  const PortfolioClip2({required this.index});

  final int index;
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..color = const Color(0xff414141)
      //..color = const Color(0xff83CCFB)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path()

      /// left box
      ..moveTo(20, 0)
      ..lineTo((width / 2) - 30, 0)

      /// top curve
      ..arcToPoint(Offset((width / 2) - 10, 10), radius: const Radius.circular(25))
      ..quadraticBezierTo(
        (width / 2),
        (height / 2) + 0,
        (width / 2) + 10,
        10,
      )
      ..arcToPoint(Offset((width / 2) + 30, 0), radius: const Radius.circular(25))

      /// right box
      ..lineTo(width - 20, 0)
      ..arcToPoint(Offset(width - 20, height), radius: const Radius.circular(25))

      /// right box
      ..lineTo((width / 2) + 30, height)

      /// bottom curve
      ..arcToPoint(Offset((width / 2) + 10, height - 10), radius: const Radius.circular(25))
      ..quadraticBezierTo(
        (width / 2),
        (height / 2) - 0,
        (width / 2) - 10,
        height - 10,
      )
      ..arcToPoint(Offset((width / 2) - 30, height), radius: const Radius.circular(25))

      /// left box

      ..lineTo(20, height)
      ..arcToPoint(const Offset(20, 0), radius: const Radius.circular(25));

    /// draw fill
    canvas.drawPath(path, paint);

    /// draw outline
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = const Color(0xff333333),
    );

    index == 0
        ? canvas.drawPath(
            Path()
              ..moveTo(20, 0)
              ..lineTo((width / 2) - 30, 0)
              ..arcToPoint(Offset((width / 2) - 30, height), radius: const Radius.circular(25))
              ..lineTo(20, height)
              ..arcToPoint(const Offset(20, 0), radius: const Radius.circular(25)),
            paint..color = Colors.blue,
          )
        : canvas.drawPath(
            Path()
              ..moveTo((width / 2) + 30, 0)
              ..lineTo(width - 20, 0)
              ..arcToPoint(Offset(width - 20, height), radius: const Radius.circular(25))
              ..lineTo((width / 2) + 30, height)
              ..arcToPoint(Offset((width / 2) + 30, 0), radius: const Radius.circular(25)),
            paint..color = Colors.lightBlueAccent,
          );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
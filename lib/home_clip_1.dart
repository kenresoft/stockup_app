import 'package:flutter/material.dart';

class HomeClip1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffCECB7D)
      ..style = PaintingStyle.fill
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    final paint2 = Paint()
      ..color = const Color(0xff131312)
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    const double start = 20;
    const double origin = 0;

    final path = Path();
    path.moveTo(start, origin);
    path.lineTo(120, origin);
    path.arcToPoint(const Offset(140, start), radius: const Radius.circular(start), clockwise: true);
    path.lineTo(160, 180);
    path.arcToPoint(const Offset(140, 200), radius: const Radius.circular(start), clockwise: true);
    path.lineTo(start, 200);
    path.arcToPoint(const Offset(origin, 180), radius: const Radius.circular(start), clockwise: true);
    path.lineTo(origin, start);
    path.arcToPoint(const Offset(start, origin), radius: const Radius.circular(start), clockwise: true);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';

class HomeClip1 extends CustomPainter {
  const HomeClip1(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = const Color(0xff131312)
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    final paint2 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double width = size.width;
    final double height = size.height;

    final path = Path();
    path.moveTo(35, 0);

    /// Top Right
    path.lineTo(width - 85, 0);
    path.arcToPoint(Offset(width - 50, 30), radius: const Radius.circular(35), clockwise: true);

    /// Bottom Right
    path.lineTo(width - 20, 158);
    path.arcToPoint(Offset(width - 52, height), radius: const Radius.circular(34), clockwise: true);

    /// Bottom Left
    path.lineTo(35, height);
    path.arcToPoint(Offset(0, height - 35), radius: const Radius.circular(35), clockwise: true);

    /// Top Left
    path.lineTo(0, 35);
    path.arcToPoint(const Offset(35, 0), radius: const Radius.circular(35), clockwise: true);

    canvas.drawPath(path, paint2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

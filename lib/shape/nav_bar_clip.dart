import 'package:flutter/material.dart';

class NavBarClip extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final path = Path();

    path.addOval(Rect.fromCircle(center: const Offset(25, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(65, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(115, 30), radius: 30));
    path.addOval(Rect.fromCircle(center: const Offset(165, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(205, 30), radius: 25));

    path.addPath(path, const Offset(0, -3));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';

class NavBarClip extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff292929)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = const Color(0xff202020)
      ..style = PaintingStyle.stroke;

    final paint3 = Paint()
      ..color = const Color(0xff292929)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    /* path.addOval(Rect.fromCircle(center: const Offset(25, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(65, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(115, 30), radius: 30));
    path.addOval(Rect.fromCircle(center: const Offset(165, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(205, 30), radius: 25));*/

    path.addOval(Rect.fromCircle(center: const Offset(25, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(65, 30), radius: 25));

    /*// Smooth curve between the two circles
    path.moveTo(65, 55); // Move to the starting point of the curve
    path.quadraticBezierTo(85, 85, 115, 55);   // Draw a quadratic bezier curve*/

    path.addOval(Rect.fromCircle(center: const Offset(115, 30), radius: 30));
    path.addOval(Rect.fromCircle(center: const Offset(165, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(205, 30), radius: 25));

    canvas.drawPath(path, paint);
    canvas.drawPath(
        Path()
          ..moveTo(80, 13)
          ..quadraticBezierTo(87.5, 22, 93, 13),
        paint3);
    canvas.drawPath(
        Path()
          ..moveTo(137, 13)
          ..quadraticBezierTo(142.5, 22, 150, 13),
        paint3);
    canvas.drawPath(
        Path()
          ..moveTo(137, 13)
          ..quadraticBezierTo(142.5, 22, 150, 13),
        paint3);
    //canvas.drawPath(path.shift(const Offset(0, 2)), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

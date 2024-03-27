import 'package:flutter/material.dart';

class FundsClip extends CustomPainter {
  const FundsClip(this.fillColor);

  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerPaint = Paint()
      ..color = const Color(0xff121212)
      ..style = PaintingStyle.fill;

    Paint innerPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    double width = size.width;
    double height = size.height;

    Path innerPath = Path()
      ..moveTo(width / 2, 0)
      ..lineTo(width, height / 4)
      ..lineTo(width, 3 * height / 4)
      ..lineTo(width / 2, height)
      ..lineTo(0, 3 * height / 4)
      ..lineTo(0, height / 4)
      ..close();

    width = size.width + scale;
    height = size.height + scale;

    Path outerPath = Path()
      ..moveTo((width - correction / 2) / 2, 0)
      ..lineTo(width - correction, height / 4)
      ..lineTo(width - correction, 3 * height / 4)
      ..lineTo((width - correction / 2) / 2, height)
      ..lineTo(correction, 3 * height / 4)
      ..lineTo(correction, height / 4)
      ..close();

    outerPath = outerPath.shift(
      Offset(
        -scale / 2,
        -scale / 2,
      ),
    );

    canvas.drawPath(outerPath, outerPaint);
    canvas.drawPath(innerPath, innerPaint);
  }

  double get correction => 2.0;

  double get scale => 25.0;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';

class DashedLineDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff343434)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    const dashWidth = 3;
    const dashSpace = 5;
    var currentX = 0.0;
    var currentY = 0.0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, currentY),
        Offset(currentX + dashWidth, currentY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DashedLineDivider extends StatelessWidget {
  const DashedLineDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLineDividerPainter(),
    );
  }
}

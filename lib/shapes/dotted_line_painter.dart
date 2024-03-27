import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
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

    while (currentX < 1.9 * size.width / 6) {
      canvas.drawLine(
        Offset(currentX, currentY),
        Offset(currentX + dashWidth, currentY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }

    while (currentY < 10) {
      canvas.drawLine(
        Offset(currentX, currentY),
        Offset(currentX + dashWidth, currentY + dashWidth),
        paint,
      );
      currentX += dashWidth + dashSpace;
      currentY += dashWidth + dashSpace;
    }
    while (currentX < 3.8 * size.width / 6) {
      canvas.drawLine(
        Offset(currentX, currentY),
        Offset(currentX + dashWidth, currentY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
    while (currentY > 0) {
      canvas.drawLine(
        Offset(currentX, currentY),
        Offset(currentX + dashWidth, currentY - dashWidth),
        paint,
      );
      currentX += dashWidth + dashSpace;
      currentY -= dashWidth + dashSpace;
    }
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

class DottedLineWidget extends StatelessWidget {
  const DottedLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedLinePainter(),
      size: Size(MediaQuery.of(context).size.width - 50, 10),
    );
  }
}

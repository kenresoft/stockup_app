import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff343434)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    double dashWidth = 3.w;
    double dashSpace = 5.w;
    var currentX = 0.0;
    var currentY = 0.0;

    while (currentX < 1.9.w * size.width / 6.w) {
      canvas.drawLine(
        Offset(currentX, currentY),
        Offset(currentX + dashWidth, currentY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }

    while (currentY < 10.h) {
      canvas.drawLine(
        Offset(currentX, currentY),
        Offset(currentX + dashWidth, currentY + dashWidth),
        paint,
      );
      currentX += dashWidth + dashSpace;
      currentY += dashWidth + dashSpace;
    }
    while (currentX < 3.8.w * size.width / 6.w) {
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

class DashedLineSpacer extends StatelessWidget {
  const DashedLineSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }
}

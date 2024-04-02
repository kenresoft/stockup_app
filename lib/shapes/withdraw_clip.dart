import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawClip extends StatelessWidget {
  const WithdrawClip({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    Paint paint = Paint()
      ..color = const Color(0xff121212)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    Path path = Path()
      ..moveTo(0, height)
      ..lineTo(width / 3.5, height)
      ..cubicTo((width / 3.5), height, (width / 2.8) - 15.w, 0, width / 2.8, 0)
      ..lineTo(width - (width / 2.8), 0)
      ..cubicTo(width - (width / 2.8) + 15.w, 0, width - (width / 3.5), height, width - (width / 3.5), height)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
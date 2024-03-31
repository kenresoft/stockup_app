import 'package:flutter/material.dart';

class InviteClip extends StatelessWidget {
  const InviteClip({super.key});

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
      ..color = const Color(0xff84CEFE)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(width / 2.8, 0)
      //..arcToPoint(Offset(width - (width / 2.7), 0), radius: Radius.circular(40), clockwise: false)
      ..cubicTo((width / 2)-40, height, (width / 2)+40, height, width - (width / 2.8), 0)
      //..quadraticBezierTo(width / 2, height, width - (width / 2.7), 0)
      ..lineTo(width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

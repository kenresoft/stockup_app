import 'package:flutter/material.dart';

class InviteEarningsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..color = const Color(0xff222222)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;
    final path = Path();

    path.moveTo(20, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(20, height);
    path.arcToPoint(
      const Offset(20, 0),
      radius: const Radius.circular(20),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class InviteEarningsClip extends StatelessWidget {
  const InviteEarningsClip({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InviteEarningsPainter(),
      child: child,
    );
  }
}

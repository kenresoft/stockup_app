import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteEarningsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..color = const Color(0xff222222)
      ..style = PaintingStyle.fill;
    final path = Path();

    path.moveTo(20.w, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(20.w, height);
    path.arcToPoint(
      Offset(20.w, 0),
      radius: const Radius.circular(20).r,
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

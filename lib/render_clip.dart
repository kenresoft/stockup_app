import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavBarClipRenderObject extends RenderProxyBox {
  NavBarClipRenderObject(RenderBox child) : super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final paint = Paint()
      ..color = const Color(0xff292929)
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = const Color(0xff202020)
      ..style = PaintingStyle.fill;

    final curvePaint = Paint()
      ..color = const Color(0xff292929)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.addOval(Rect.fromCircle(center: const Offset(25, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(70, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(120, 30), radius: 30));
    path.addOval(Rect.fromCircle(center: const Offset(170, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(215, 30), radius: 25));

    canvas.drawPath(path, paint);

    /// 1 - 2
    canvas.drawPath(
        Path()
          ..moveTo(40, 13)
          ..quadraticBezierTo(47.5, 22, 55, 13),
        curvePaint);

    /// 2 - 3
    canvas.drawPath(
        Path()
          ..moveTo(85, 13)
          ..quadraticBezierTo(92.5, 22, 98, 13),
        curvePaint);

    /// 3 - 4
    canvas.drawPath(
        Path()
          ..moveTo(142, 13)
          ..quadraticBezierTo(147.5, 22, 155, 13),
        curvePaint);

    /// 4 - 5
    canvas.drawPath(
        Path()
          ..moveTo(185, 13)
          ..quadraticBezierTo(192.5, 22, 200, 13),
        curvePaint);

    canvas.drawPath(path.shift(const Offset(0, 2)), shadowPaint);

    super.paint(context, offset);
  }
}

/*class NavBarClip extends SingleChildRenderObjectWidget {
  NavBarClip({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return NavBarClipRenderObject();
  }
}*/

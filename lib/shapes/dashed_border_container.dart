import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final Color? borderColor;

  const DashedBorderContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(width ?? MediaQuery.of(context).size.width, height ?? 56),
        painter: DashedBorderPainter(borderColor),
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  const DashedBorderPainter(this.color);

  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const dashWidth = 10.0;
    const dashHeight = 10.0;
    const dashSpace = 2; // Adjust gap as needed

    // Horizontal dash for top and bottom borders
    final horizontalDash = Path();
    horizontalDash.moveTo(0, 0);
    horizontalDash.lineTo(dashWidth, 0);

    // Vertical dash for left and right borders
    final verticalDash = Path();
    verticalDash.moveTo(0, 0);
    verticalDash.lineTo(0, dashHeight);

    // Top border
    Path topBorder = Path();
    topBorder.moveTo(0, 0);
    for (double i = 0; i < size.width; i += (dashWidth + dashSpace)) {
      topBorder.addPath(horizontalDash, Offset(i, 0));
    }

    // Bottom border
    Path bottomBorder = Path();
    bottomBorder.moveTo(0, size.height);
    for (double i = 0; i < size.width; i += (dashWidth + dashSpace)) {
      bottomBorder.addPath(horizontalDash, Offset(i, size.height));
    }

    // Left border
    Path leftBorder = Path();
    leftBorder.moveTo(0, 0);
    for (double i = 0; i <= size.height; i += (dashHeight + dashSpace)) {
      leftBorder.moveTo(-1, i);
      leftBorder.lineTo(-1, i + dashHeight);
    }

    // Right border
    Path rightBorder = Path();
    rightBorder.moveTo(size.width, 0);
    for (double i = 0; i <= size.height; i += (dashHeight + dashSpace)) {
      rightBorder.moveTo(size.width + 1, i);
      rightBorder.lineTo(size.width + 1, i + dashHeight);
    }

    canvas.drawPath(topBorder, paint);
    canvas.drawPath(bottomBorder, paint);
    canvas.drawPath(leftBorder, paint);
    canvas.drawPath(rightBorder, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

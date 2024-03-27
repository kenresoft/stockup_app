import 'package:flutter/cupertino.dart';

class Custom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(width(size) * 0.5750000, 0);
    path_0.quadraticBezierTo(
      width(size) * 0.5762000,
      height(size) * 0.3503375,
      width(size) * 0.5750000,
      height(size) * 0.3750000,
    );
    path_0.cubicTo(
      width(size) * 0.5766500,
      height(size) * 0.4022750,
      width(size) * 0.2723250,
      height(size) * 0.3584125,
      width(size) * 0.2750000,
      height(size) * 0.4375000,
    );
    path_0.cubicTo(
      width(size) * 0.2754250,
      height(size) * 0.5013875,
      width(size) * 0.5733000,
      height(size) * 0.4643750,
      width(size) * 0.5750000,
      height(size) * 0.4875000,
    );
    path_0.quadraticBezierTo(
      width(size) * 0.5750000,
      height(size) * 0.6156250,
      width(size) * 0.5750000,
      height(size),
    );
    path_0.lineTo(width(size), height(size));
    path_0.lineTo(width(size), 0);
    path_0.lineTo(width(size) * 0.5750000, 0);
    path_0.close();

/*    onPanUpdate: (details) {
      setState(() {
        final renderBox = context.findRenderObject() as RenderBox;
        final localPosition = renderBox.globalToLocal(details.globalPosition);
        print("localPosition: $(localPosition}");
        _offsets.add(localPosition);
      });
    }*/

    //canvas.drawPath(path_0, paint_0);
    return path_0;
  }



  double height(Size size) => size.height;

  double width(Size size) => size.width;

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

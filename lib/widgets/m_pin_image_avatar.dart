import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MPinImageAvatar extends StatelessWidget {
  const MPinImageAvatar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: UnconstrainedBox(
        child: ClipOval(
          child: CircleAvatar(
            backgroundColor: const Color(0xff040404),
            radius: 55.r,
            child: ClipOval(
              child: CircleAvatar(
                radius: 48.r,
                child: Image(
                  width: 100.w,
                  height: 100.h,
                  image: const AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

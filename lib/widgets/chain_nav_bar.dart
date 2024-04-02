import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shapes/nav_bar_clip.dart';

class ChainNavBar extends StatelessWidget {
  const ChainNavBar({
    super.key,
    this.onChange,
    required this.currentIndex,
  });

  final ValueChanged<int>? onChange;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center the Stack within Positioned
      children: [
        CustomPaint(
          painter: NavBarClip(),
          child: SizedBox(width: 230.w, height: 61.h),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 20.w),
            GestureDetector(
              onTap: () => onChange?.call(0),
              child: Container(
                width: 45.w,
                height: 45.w,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: currentIndex == 0 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(30).r,
                ),
                child: Icon(Icons.add_home_outlined, color: Colors.white, size: 24.sp),
              ),
            ),
            //const SizedBox(width: 22.5),
            GestureDetector(
              onTap: () => onChange?.call(1),
              child: Container(
                width: 45.w,
                height: 45.w,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: currentIndex == 1 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(30).r,
                ),
                child: Icon(Icons.bookmark_border_rounded, color: Colors.white, size: 24.sp),
              ),
            ),
            //const SizedBox(width: 25),
            GestureDetector(
              onTap: () => onChange?.call(2),
              child: Container(
                width: 65.w,
                height: 65.w,
                margin:  EdgeInsets.only(top: 2.h),
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(35).r,
                ),
                child: Icon(Icons.home_repair_service_outlined, color: Colors.white, size: 24.sp),
              ),
            ),
            //const SizedBox(width: 25),
            GestureDetector(
              onTap: () => onChange?.call(3),
              child: Container(
                width: 45.w,
                height: 45.w,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: currentIndex == 3 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(30).r,
                ),
                child: Icon(Icons.list_alt_rounded, color: Colors.white, size: 24.sp),
              ),
            ),
            //const SizedBox(width: 22.5),
            GestureDetector(
              onTap: () => onChange?.call(4),
              child: Container(
                width: 45.w,
                height: 45.w,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: currentIndex == 4 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(30).r,
                ),
                child: Icon(Icons.person_outline_rounded, color: Colors.white, size: 24.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

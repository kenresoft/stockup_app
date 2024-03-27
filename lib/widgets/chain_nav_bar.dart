import 'package:flutter/material.dart';

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
          child: const SizedBox(width: 230, height: 61),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => onChange?.call(0),
              child: Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: currentIndex == 0 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.add_home_outlined, color: Colors.white),
              ),
            ),
            //const SizedBox(width: 22.5),
            GestureDetector(
              onTap: () => onChange?.call(1),
              child: Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: currentIndex == 1 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.bookmark_border_rounded, color: Colors.white),
              ),
            ),
            //const SizedBox(width: 25),
            GestureDetector(
              onTap: () => onChange?.call(2),
              child: Container(
                width: 65,
                height: 65,
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Icon(Icons.home_repair_service_outlined, color: Colors.white),
              ),
            ),
            //const SizedBox(width: 25),
            GestureDetector(
              onTap: () => onChange?.call(3),
              child: Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: currentIndex == 3 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.list_alt_rounded, color: Colors.white),
              ),
            ),
            //const SizedBox(width: 22.5),
            GestureDetector(
              onTap: () => onChange?.call(4),
              child: Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: currentIndex == 4 ? const Color(0xff83CCFB) : null,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.person_outline_rounded, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

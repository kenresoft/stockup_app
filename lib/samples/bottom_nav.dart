import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      width: width,
      height: 100,
      left: width / 4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildNavIcon(0, CupertinoIcons.house_alt),
          buildNavIcon(40, CupertinoIcons.bookmark),
          buildNavIcon(140, CupertinoIcons.square_list),
          buildNavIcon(180, CupertinoIcons.person),
          Positioned(
            bottom: 20,
            height: 70,
            width: 70,
            left: 80,
            child: Card(
              color: const Color(0xff202020),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
              elevation: 0,
              shadowColor: Colors.grey,
              margin: EdgeInsets.zero,
              surfaceTintColor: const Color(0xff202020),
              /* decoration: BoxDecoration(
                      color: const Color(0xff202020),
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: const [
                        BoxShadow(offset: Offset(0, -1), spreadRadius: 0, blurRadius: 1, color: Colors.grey),
                      ],
                    )*/
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(color: const Color(0xff85CFFF), borderRadius: BorderRadius.circular(35)),
                child: const Icon(
                  CupertinoIcons.bag,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildNavIcon(double position, IconData iconData) {
  return Positioned(
    bottom: 30,
    height: 50,
    width: 50,
    left: position,
    child: Card(
      color: const Color(0xff202020),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      elevation: 0,
      shadowColor: Colors.grey,
      margin: EdgeInsets.zero,
      surfaceTintColor: const Color(0xff202020),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    ),
  );
}
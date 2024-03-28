import 'package:flutter/material.dart';
import 'package:stockup_app/screens/m_pin.dart';

import '../screens/funds.dart';
import '../screens/home.dart';
import '../screens/portfolio.dart';
import 'chain_nav_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.width,
    required this.index,
  });

  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      width: width,
      height: 100,
      child: ChainNavBar(
        currentIndex: index,
        onChange: (value) {
          if (value == 0 && index != 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          } else if (value == 1 && index != 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MPin()),
            );
          } else if (value == 2 && index != 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Funds()),
            );
          } else if (value == 3 && index != 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Funds()),
            );
          } else if (value == 4 && index != 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Portfolio()),
            );
          }
        },
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stockup_app/shapes/news_switch_clip.dart';
import 'package:stockup_app/widgets/portfolio_list_tile.dart';

import '../models/watchlist.dart';
import '../shapes/dashed_line_spacer.dart';
import '../shapes/portfolio_clip.dart';
import '../shapes/portfolio_switch_clip.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  int index = 4;
  int switchIndex = 0;

  final watchList = <Watchlist>[
    Watchlist(
      (100, 1650.23, -2.24),
      ('HDFCBANK', -40.16),
      (16502, 1601.65, -2.24),
    ),
    Watchlist(
      (2, 16250.46, 13.35),
      ('INF', 499.65),
      (2500.56, 1370.35, 2.24),
    ),
    Watchlist(
      (100, 157.75, 10.35),
      ('INF', 1500.65),
      (15775, 170.35, 2.24),
    ),
    Watchlist(
      (5, 2463.98, 12.96),
      ('BALKRISND', 1365.65),
      (2400, 1601.65, -2.24),
    ),
    Watchlist(
      (10, 776.70, -23.36),
      ('JUSTDIAL', -586.12),
      (1000, 47.22, -0.94),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center, // Center the Stack within Positioned
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(color: const Color(0xff2B2B2B), height: 50.h),
                  SizedBox(
                    height: 396.h,
                    child: Stack(
                      children: [
                        /// Background
                        Positioned(
                          top: -1,
                          height: 230.h,
                          width: width,
                          child: Container(color: const Color(0xff2B2B2B)),
                        ),

                        /// Toolbar
                        Positioned(
                          top: 10.h,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25).w,
                            child: Text(
                              'Portfolio',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.h),
                            ),
                          ),
                        ),

                        /// Switch
                        Positioned(
                          width: width,
                          top: 77.h,
                          height: 52.h,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25).w,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  child: CustomPaint(
                                    painter: PortfolioSwitchClip(currentIndex: switchIndex),
                                    child: Container(
                                      width: width,
                                      height: 52.h,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: width / 7),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Holdings',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: switchIndex == 0 ? Colors.black : Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Orders',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: switchIndex == 1 ? Colors.black : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTapUp: (details) {
                                    setState(() {
                                      details.globalPosition.dx < width / 2 ? switchIndex = 0 : switchIndex = 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// Dashboard Head
                        Positioned(
                          width: width,
                          top: 170.h,
                          height: 200.h,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25).w,
                            child: CustomPaint(
                              painter: PortfolioClip(),
                              child: Container(
                                padding: EdgeInsets.all(20.r).copyWith(top: 30.h, bottom: 15.h),
                                child:  Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Invested',
                                          style: TextStyle(fontSize: 14.h,fontWeight: FontWeight.bold, color: const Color(0xff34414B)),
                                        ),
                                        Text(
                                          'Current',
                                          style: TextStyle(fontSize: 14.h,fontWeight: FontWeight.bold, color: const Color(0xff34414B)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '50,560',
                                          style: TextStyle(fontSize: 25.h, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '60,112',
                                          style: TextStyle(fontSize: 25.h, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5.h),
                                      child: Divider(thickness: 2.h, color: const Color(0xff658197)),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'P&L',
                                          style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.bold),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '9,552',
                                              style: TextStyle(fontSize: 25.h, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '(+18.56%)',
                                              style: TextStyle(fontSize: 14.h, color: Colors.green, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fromRect(
                          rect: Rect.fromCenter(center: Offset(width / 2, 370.h), width: 105.w, height: 48.h),
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                              backgroundColor: const MaterialStatePropertyAll(Color(0xff1F1F1F)),
                              foregroundColor: const MaterialStatePropertyAll(Color(0xff83CCFB)),
                              side: MaterialStatePropertyAll(BorderSide(color: const Color(0xff2A2A2A), width: 2.w)),
                            ),
                            onPressed: () {},
                            child: Text('Add Money', style: TextStyle(fontSize: 14.h)),
                          ),
                        )
                      ],
                    ),
                  ),

                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 25).w,
                        child: Column(
                          children: [
                            const DashedLineSpacer(),
                            SizedBox(height: 54.h),
                            Transform(transform: Matrix4.identity()..rotateX(pi), child: const DashedLineSpacer()),
                          ],
                        ),
                      ),
                      Container(
                        height: 55.h,
                        margin: EdgeInsets.symmetric(horizontal: 25.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(CupertinoIcons.search, color: Colors.white),
                            Row(
                              children: [
                                const Icon(CupertinoIcons.slider_horizontal_3, color: Colors.white),
                                SizedBox(width: 20.w),
                                const Icon(CupertinoIcons.chart_pie, color: Colors.white),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  /*SizedBox(
                    width: width,
                    height: 20,
                    child: SvgPicture.asset(
                      'assets/images/line.svg',
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.color),
                    ),
                  ),*/

                  /// Portfolio List Body
                  SizedBox(
                    height: 500.h,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PortfolioListTile(
                          width: width,
                          index: index,
                          watchList: watchList,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          width: width,
                          height: 2.h,
                          decoration: const BoxDecoration(
                            gradient: RadialGradient(colors: [Color(0xff383838), Colors.transparent], radius: 160),
                          ),
                        );
                      },
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),

            /// Bottom Nav
            CustomBottomNavigationBar(width: width, index: index),
          ],
        ),
      ),
    );
  }
}

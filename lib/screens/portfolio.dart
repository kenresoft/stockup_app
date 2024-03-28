import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shapes/dotted_line_painter.dart';
import '../shapes/portfolio_clip.dart';
import '../shapes/portfolio_clip_2.dart';
import '../widgets/chain_nav_bar.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  int index = 0;
  int switchIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                  Container(color: const Color(0xff2B2B2B), height: height * .05),
                  SizedBox(
                    height: height * .396,
                    child: Stack(
                      children: [
                        /// Background
                        Positioned(
                          top: -1,
                          height: height * .23,
                          width: width,
                          child: Container(color: const Color(0xff2B2B2B)),
                        ),

                        /// Toolbar
                        Positioned(
                          top: 10,
                          width: width,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'Portfolio',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ),
                        ),

                        /// Switch
                        Positioned(
                          width: width,
                          top: (height * .2) / 2.6,
                          height: height * .052,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Stack(
                              children: [
                                GestureDetector(
                                  child: CustomPaint(
                                    painter: PortfolioSwitchClip(currentIndex: switchIndex),
                                    child: Container(
                                      width: width,
                                      height: height * .052,
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
                          top: height * .17,
                          height: height * .2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: CustomPaint(
                              painter: PortfolioClip(),
                              child: Container(
                                padding: const EdgeInsets.all(20).copyWith(top: 30, bottom: 15),
                                child: const Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Invested',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff34414B)),
                                        ),
                                        Text(
                                          'Current',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff34414B)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '50,560',
                                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '60,112',
                                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      child: Divider(thickness: 2, color: Color(0xff658197)),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'P&L',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '9,552',
                                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '(+18.56%)',
                                              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
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
                          rect: Rect.fromCenter(center: Offset(width / 2, height * .37), width: 105, height: 48),
                          child: OutlinedButton(
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(EdgeInsets.zero),
                              backgroundColor: MaterialStatePropertyAll(Color(0xff1F1F1F)),
                              foregroundColor: MaterialStatePropertyAll(Color(0xff83CCFB)),
                              side: MaterialStatePropertyAll(BorderSide(color: Color(0xff2A2A2A), width: 2)),
                            ),
                            onPressed: () {},
                            child: const Text('Add Money'),
                          ),
                        )
                      ],
                    ),
                  ),

                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const DottedLineWidget(),
                            const SizedBox(height: 45),
                            Transform(transform: Matrix4.identity()..rotateX(pi), child: const DottedLineWidget()),
                          ],
                        ),
                      ),
                      Container(
                        height: 55,
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(CupertinoIcons.search, color: Colors.white),
                            Row(
                              children: [
                                Icon(CupertinoIcons.slider_horizontal_3, color: Colors.white),
                                SizedBox(width: 20),
                                Icon(CupertinoIcons.chart_pie, color: Colors.white),
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
                  Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 10),
                    //color: Colors.blue,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.mail_outline, color: Color(0xff7DC3F0)),
                                SizedBox(width: 6),
                                Text('100', style: TextStyle(color: Color(0xff7DC3F0))),
                                SizedBox(width: 6),
                                Text(
                                  'Avg. 1650.23',
                                  style: TextStyle(color: Color(0xff696969)),
                                ),
                              ],
                            ),
                            Text(
                              '(-2.24%)',
                              style: TextStyle(color: Color(0xff963B3B)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HDFCBANK',
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            Text(
                              '-40.16',
                              style: TextStyle(color: Color(0xffB94646), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Invested 16,502',
                              style: TextStyle(color: Color(0xff696969)),
                            ),
                            Row(
                              children: [
                                Text(
                                  'LTP',
                                  style: TextStyle(color: Color(0xff696969)),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '1601.65',
                                  style: TextStyle(color: Color(0xff696969), fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '(-2.24%)',
                                  style: TextStyle(color: Color(0xff963B3B)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Bottom Nav
            Positioned(
              bottom: 30,
              width: width,
              height: 100,
              //left: width / 4,
              child: ChainNavBar(
                currentIndex: index,
                onChange: (value) {
                  setState(() {
                    index = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}

extension Log<T> on T {
  T get log {
    debugPrint(toString());
    return this;
  }
}

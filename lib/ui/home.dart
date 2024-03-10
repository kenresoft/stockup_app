import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockup_app/shapes/home_clip_1.dart';

import '../plots/chart.dart';
import '../shapes/home_clip_2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //appBar: AppBar(backgroundColor: const Color(0xff84CEFE), toolbarHeight: 0, scrolledUnderElevation: 0),
      backgroundColor: const Color(0xff121212),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color(0xff84CEFE),
                  height: height * .05,
                ),
                SizedBox(
                  height: height * .45,
                  child: Stack(
                    children: [
                      /// Background
                      Positioned(
                        top: 0,
                        height: height * .3,
                        width: width,
                        child: Container(
                          color: const Color(0xff84CEFE),
                          //height: 200,
                        ),
                      ),

                      /// Toolbar
                      Positioned(
                        top: 10,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipOval(
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffAD3B42),
                                  maxRadius: height * .03,
                                  child: const Image(
                                    image: ExactAssetImage('assets/images/profile.jpg'),
                                    fit: BoxFit.fitHeight,
                                    height: 60,
                                    colorBlendMode: BlendMode.multiply,
                                    color: Color(0xffAD3B42),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: const Color(0xffffffff),
                                maxRadius: height * .03,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffB2DDF9),
                                  maxRadius: (height * .03) - 1,
                                  child: const Icon(CupertinoIcons.bell, size: 28),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// TextField
                      Positioned(
                        width: width,
                        top: (height * .2) / 2,
                        height: height * .055,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                              fillColor: const Color(0xffB2DDF9),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// Dashboard Head
                      Positioned(
                        width: width + 50,
                        top: height * .2,
                        // right: 5,
                        height: height * .23,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0 /*30*/),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildBoardA(
                                context,
                                const Color(0xffCECB7D),
                                const Color(0xff579B34),
                                ('NIFTY 50', '18,755.45', '+70.5 (0.37)'),
                              ),
                              buildBoardA(
                                context,
                                const Color(0xffADB6E5),
                                const Color(0xffB8232D),
                                ('NIFTY 50', '18,755.45', '+70.5 (0.37)'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Dashboard Body
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TOP GAINERS', style: TextStyle(color: Color(0xffCFCFCF), fontSize: 18)),
                      Text('See all', style: TextStyle(color: Color(0xff898989), fontSize: 16)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                    child: Row(
                      children: [
                        buildBoardB(context),
                        buildBoardB(context),
                        buildBoardB(context),
                        buildBoardB(context),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TOP LOOSERS', style: TextStyle(color: Color(0xffCFCFCF), fontSize: 18)),
                      Text('See all', style: TextStyle(color: Color(0xff898989), fontSize: 16)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                    child: Row(
                      children: [
                        buildBoardB(context),
                        buildBoardB(context),
                        buildBoardB(context),
                        buildBoardB(context),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('STOCK IN NEWS', style: TextStyle(color: Color(0xffCFCFCF), fontSize: 18)),
                      Text('See all', style: TextStyle(color: Color(0xff898989), fontSize: 16)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                    child: Row(
                      children: [
                        buildBoardB(context),
                        buildBoardB(context),
                        buildBoardB(context),
                        buildBoardB(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Bottom Nav
          Positioned(
            bottom: 30,
            height: height * .07,
            width: width,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Text('Home')),
            ),
          )
        ],
      ),
    );
  }

  Container buildBoardB(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    debugPrint(height.toString());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: height * 0.014),
      height: height * .18,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width * 0.38, height * 0.123),
            painter: const HomeClip2(Color(0xff1A1A1A)),
          ),
          const Positioned(
            top: 0,
            child: ClipOval(
              child: CircleAvatar(
                child: Image(
                  image: ExactAssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.fitHeight,
                  height: 60,
                  colorBlendMode: BlendMode.multiply,
                  color: Color(0xffaaaaaa),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBoardA(BuildContext context, Color bgColor, Color textColor, (String, String, String) text) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CustomPaint(
      //size: Size.fromWidth(width * 0.48),
      size: Size((width * 0.48).log, (height * .23).log),
      painter: HomeClip1(bgColor),
      child: SizedBox(
        width: width * .47,
        height: height * .23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * .015),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Text('NIFTY 50', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Text(
                '18,755.45',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                '+70.5 (0.37%)',
                style: TextStyle(fontSize: 15, color: textColor, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26, left: 20),
              child: LinePlot(height: height * .09, color: textColor),
            ),
            //const SizedBox(height: 30),
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

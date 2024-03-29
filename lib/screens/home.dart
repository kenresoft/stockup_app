import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockup_app/plot/chart.dart';

import '../shapes/home_clip_1.dart';
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
                              prefixIcon: const Icon(CupertinoIcons.search, size: 30),
                              suffixIcon: const Icon(CupertinoIcons.slider_horizontal_3),
                              hintText: 'Search here..',
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
                        buildBoardB(context, 'TATA MOTORS', '564.30', '+ 6.86 (5.71%)'),
                        buildBoardB(context, 'WIPRO', '383.35', '+ 24.56 (5.11%)'),
                        buildBoardB(context, 'TATA MOTORS', '564.30', '+ 6.86 (5.71%)'),
                        buildBoardB(context, 'WIPRO', '383.35', '+ 24.56 (5.11%)'),
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
                        buildBoardB(context, 'BAJAJ FINSERY', '1,510.96', '- 15.56 (0.23%)'),
                        buildBoardB(context, 'EXIDE IND.', '220.50', '- 13.76 (0.4%)'),
                        buildBoardB(context, 'BAJAJ FINSERY', '1,510.96', '- 15.56 (0.23%)'),
                        buildBoardB(context, 'EXIDE IND.', '220.50', '- 13.76 (0.4%)'),
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
                        buildBoardB(context, 'TATA MOTORS', '564.30', '+ 6.86'),
                        buildBoardB(context, 'TATA MOTORS', '564.30', '+ 6.86'),
                        buildBoardB(context, 'TATA MOTORS', '564.30', '+ 6.86'),
                        buildBoardB(context, 'TATA MOTORS', '564.30', '+ 6.86'),
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
          ),
        ],
      ),
    );
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

  Container buildBoardB(BuildContext context, String text1, String text2, String text3) {
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
          ),
          Positioned(
            top: 45,
            height: 90,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(text1, style: const TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(text2, style: const TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(text3, style: TextStyle(color: text3.contains('-') ? Colors.red : Colors.green)),
                  ),
                ],
              ),
            ),
          ),
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

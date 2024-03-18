import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stockup_app/plot/chart.dart';
import 'package:stockup_app/shape/home_clip_1.dart';
import 'package:stockup_app/shape/home_clip_2.dart';
import 'package:stockup_app/shape/portfolio_clip.dart';
import 'package:stockup_app/shape/portfolio_clip_2.dart';
import 'package:stockup_app/ui/chain_nav_bar.dart';

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
          alignment: Alignment.center, // Center the Stack within Positioned
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(color: const Color(0xff2B2B2B), height: height * .05),
                  SizedBox(
                    height: height * .45,
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

            /*Positioned(
              bottom: 30,
              width: width,
              height: 100,
              left: 448 / 4,
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
                      */ /* decoration: BoxDecoration(
                        color: const Color(0xff202020),
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, -1), spreadRadius: 0, blurRadius: 1, color: Colors.grey),
                        ],
                      )*/ /*
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
            ),*/
          ],
        ),
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

class BoardClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final width = size.width;
    final height = size.height;

    var path = Path();
    /*path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);*/
    /*path.lineTo(0, size.height - 50);
    path.arcToPoint(
      Offset(size.width, size.height - 50),
      radius: Radius.circular(200),
      clockwise: false,
    );
    path.lineTo(size.width, 0);*/

    path.addOval(Rect.fromCircle(center: const Offset(25, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(65, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(115, 30), radius: 30));
    path.addOval(Rect.fromCircle(center: const Offset(165, 30), radius: 25));
    path.addOval(Rect.fromCircle(center: const Offset(205, 30), radius: 25));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockup_app/home_clip_1.dart';

import 'chart.dart';
import 'home_clip_2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                  height: 60,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .45,
                  child: Stack(
                    children: [
                      /// Background
                      Positioned(
                        top: 0,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          color: const Color(0xff84CEFE),
                          height: 200,
                        ),
                      ),

                      /// Toolbar
                      Positioned(
                        top: 10,
                        width: MediaQuery.of(context).size.width,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipOval(
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffAD3B42),
                                  maxRadius: 28,
                                  child: Image(
                                    image: ExactAssetImage('assets/images/profile.jpg'),
                                    fit: BoxFit.fitHeight,
                                    height: 60,
                                    colorBlendMode: BlendMode.multiply,
                                    color: Color(0xffAD3B42),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xffffffff),
                                maxRadius: 28,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffB2DDF9),
                                  maxRadius: 27,
                                  child: Icon(CupertinoIcons.bell, size: 28),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// TextField
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        top: 90,
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
                        width: MediaQuery.of(context).size.width + 50,
                        top: 180,
                        // right: 5,
                        height: 230,
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
            height: 60,
            width: MediaQuery.of(context).size.width,
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 23),
      height: 150,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width * 0.38, 120),
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

  CustomPaint buildBoardA(BuildContext context, Color bgColor, Color textColor, (String, String, String) text) {
    return CustomPaint(
      size: Size.fromWidth(MediaQuery.of(context).size.width * 0.48),
      painter: HomeClip1(bgColor),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .47,
        height: MediaQuery.of(context).size.height * .25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Text(
                '+70.5 (0.37%)',
                style: TextStyle(fontSize: 15, color: textColor, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26, left: 20),
              child: LinePlot(height: 85, color: textColor),
            ),
            //const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

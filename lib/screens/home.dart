import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stockup_app/plot/chart.dart';

import '../shapes/home_clip_1.dart';
import '../shapes/home_clip_2.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 506.h,
                    child: Stack(
                      children: [
                        /// Background
                        Positioned(
                          top: 0,
                          height: 356.h,
                          width: 1.sw,
                          child: Container(
                            color: const Color(0xff84CEFE),
                          ),
                        ),

                        /// Toolbar
                        Positioned(
                          top: 66.h,
                          width: 1.sw,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30).w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipOval(
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xffAD3B42),
                                    maxRadius: 30.h,
                                    child: Image(
                                      image: const ExactAssetImage('assets/images/profile.jpg'),
                                      fit: BoxFit.fitHeight,
                                      height: 60.h,
                                      colorBlendMode: BlendMode.multiply,
                                      color: const Color(0xffAD3B42),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, '/invite'),
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xffffffff),
                                    maxRadius: 30.h,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xffB2DDF9),
                                      maxRadius: 28.h,
                                      child: const Icon(CupertinoIcons.bell, size: 28),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// TextField
                        Positioned(
                          width: 1.sw,
                          top: 156.h,
                          height: 55.h,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30).w,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(CupertinoIcons.search, size: 30.h),
                                suffixIcon: const Icon(CupertinoIcons.slider_horizontal_3),
                                hintText: 'Search here..',
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 30.h),
                                fillColor: const Color(0xffB2DDF9),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                  borderSide: const BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                  borderSide: const BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// Dashboard Head
                        Positioned(
                          width: 1.sw + 50,
                          top: 265.h,
                          height: 220.h,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TOP GAINERS', style: TextStyle(color: const Color(0xffCFCFCF), fontSize: 18.sp)),
                        Text('See all', style: TextStyle(color: const Color(0xff898989), fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15).w,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TOP LOOSERS', style: TextStyle(color: Color(0xffCFCFCF), fontSize: 18.sp)),
                        Text('See all', style: TextStyle(color: Color(0xff898989), fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15).w,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('STOCK IN NEWS', style: TextStyle(color: const Color(0xffCFCFCF), fontSize: 18.sp)),
                        Text('See all', style: TextStyle(color: const Color(0xff898989), fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15).w,
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
            CustomBottomNavigationBar(width: 1.sw, index: index),
          ],
        ),
      ),
    );
  }

  Container buildBoardB(BuildContext context, String text1, String text2, String text3) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      height: 180.h,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(171.w, 123.h),
            painter: const HomeClip2(Color(0xff1A1A1A)),
          ),
           Positioned(
            top: 0,
            child: ClipOval(
              child: CircleAvatar(
                child: Image(
                  image: const ExactAssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.fitHeight,
                  height: 60.h,
                  colorBlendMode: BlendMode.multiply,
                  color: const Color(0xffAAAAAA),
                ),
              ),
            ),
          ),
          Positioned(
            top: 56.h,
            height: 90.h,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16).w,
                    child: Text(text1, style: TextStyle(fontSize: 14.sp,color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32).w,
                    child: Text(text2, style: TextStyle(color: Colors.white, fontSize: 18.sp)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32).w,
                    child: Text(text3, style: TextStyle(fontSize: 14.sp,color: text3.contains('-') ? Colors.red : Colors.green)),
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
    return SizedBox(
      width: 210.w,
      //height: 330.h,
      child: CustomPaint(
        painter: HomeClip1(bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
              child: Text('NIFTY 50', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
              child: Text(
                '18,755.45',
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
              child: Text(
                '+70.5 (0.37%)',
                style: TextStyle(fontSize: 15.sp, color: textColor, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 26.w, left: 20.w),
              child: LinePlot(height: 90.h, color: textColor),
            ),
            //const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

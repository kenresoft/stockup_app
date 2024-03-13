import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockup_app/shape/funds_clip.dart';
import 'package:stockup_app/shape/funds_divider_clip.dart';
import 'package:stockup_app/shape/home_clip_2.dart';

class Funds extends StatefulWidget {
  const Funds({super.key});

  @override
  State<Funds> createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //appBar: AppBar(backgroundColor: const Color(0xff84CEFE), toolbarHeight: 0, scrolledUnderElevation: 0),
      backgroundColor: const Color(0xff121212),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xff84CEFE),
              height: height * .05,
            ),
            SizedBox(
              height: height * .37,
              child: Stack(
                children: [
                  /// Background
                  Positioned(
                    top: 0,
                    height: height * .3,
                    width: width,
                    child: Container(color: const Color(0xff84CEFE)),
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
                    width: width,
                    top: height * .2599,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildBoardA(const Color(0xff9CECAE), CupertinoIcons.creditcard),
                        buildBoardA(const Color(0xffECB39C), CupertinoIcons.arrow_down_doc),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add Money', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('Withdrawal', style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 15,
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomPaint(painter: FundsDividerClip()),
            ),

            /// Dashboard Body
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(color: Color(0xffCFCFCF), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xffCFCFCF),
                    size: 23,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height / 2,
              child: ListView.builder(
                itemCount: 18,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return const ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xff222222),
                      maxRadius: 25,
                      child: Icon(CupertinoIcons.bag_badge_plus, color: Color(0xff9CECAE)),
                    ),
                    title: Text(
                      'Add Money',
                      style: TextStyle(color: Color(0xffcccccc), fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      '12 June, 2023',
                      style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xff494949)),
                    ),
                    trailing: Text('+ 2,000', style: TextStyle(fontSize: 16, color: Color(0xff9CECAE))),
                  );
                },
              ),
            ),
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

  Widget buildBoardA(Color bgColor, IconData iconData) {
    return SizedBox(
      width: 83,
      height: 100,
      child: CustomPaint(
        painter: FundsClip(bgColor),
        child: Icon(
          iconData,
          size: 45,
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

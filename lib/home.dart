import 'package:flutter/material.dart';
import 'package:stockup_app/home_clip_1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xff84CEFE), toolbarHeight: 0, scrolledUnderElevation: 0),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
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
                              CircleAvatar(
                                backgroundColor: Color(0xffAD3B42),
                                maxRadius: 28,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
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
                        width: MediaQuery.of(context).size.width + 45,
                        top: 180,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomPaint(
                                size: Size(MediaQuery.of(context).size.width * 0.45, MediaQuery.of(context).size.width * 0.45),
                                painter: const HomeClip1(Color(0xffCECB7D)),
                              ),
                              CustomPaint(
                                size: Size(MediaQuery.of(context).size.width * 0.45, MediaQuery.of(context).size.width * 0.45),
                                painter: const HomeClip1(Color(0xffADB6E5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Dashboard Body
                const Row(
                  children: [
                    Text('Top Gainers', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  color: const Color(0xff161616),
                  height: 150,
                ),
                const Row(
                  children: [
                    Text('Top Gainers', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  color: const Color(0xff161616),
                  height: 150,
                ),
                const Row(
                  children: [
                    Text('Top Gainers', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  color: const Color(0xff161616),
                  height: 150,
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
}

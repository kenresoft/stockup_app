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
      appBar: AppBar(backgroundColor: const Color(0xff84CEFE), toolbarHeight: 0),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: const Color(0xff84CEFE),
                    height: 200,
                    width: 350,
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  left: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPaint(
                        painter: HomeClip1(),
                      ),CustomPaint(
                        painter: HomeClip1(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text('Home')),
            ),
          )
        ],
      ),
    );
  }
}

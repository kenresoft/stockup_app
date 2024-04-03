import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:stockup_app/screens/funds.dart';
import 'package:stockup_app/screens/home.dart';
import 'package:stockup_app/screens/invite.dart';
import 'package:stockup_app/screens/m_pin.dart';
import 'package:stockup_app/screens/news.dart';
import 'package:stockup_app/screens/portfolio.dart';
import 'package:stockup_app/screens/withdraw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //designSize: const Size(360, 640),
      //designSize: const Size(360, 820),
      designSize: const Size(448, 998),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StockUp Mobile',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: const Color(0xff84CEFE),
          fontFamily: FontResoft.lato,
          package: FontResoft.package,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        routes: {
          '/': (context) => const Home(),
          '/funds': (context) => const Funds(),
          '/portfolio': (context) => const Portfolio(),
          '/mpin': (context) => const MPin(),
          '/withdraw': (context) => const Withdraw(),
          '/invite': (context) => const Invite(),
          '/news': (context) => const News(),
        },
      ),
    );
  }
}

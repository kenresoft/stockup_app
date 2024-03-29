import 'package:flutter/material.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:stockup_app/screens/funds.dart';
import 'package:stockup_app/screens/portfolio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
        //'/': (context) => const Home(),
        '/': (context) => const Portfolio(),
        '/funds': (context) => const Funds(),
        '/portfolio': (context) => const Portfolio(),
      },
    );
  }
}

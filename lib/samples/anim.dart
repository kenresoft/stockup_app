import 'package:flutter/material.dart';

void main() {
  runApp(MyAnim());
}

class MyAnim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bouncy Smart Animate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => SecondPage(),
                transitionsBuilder: (_, animation, __, child) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 0.0, end: 0.2).animate(
                      CurvedAnimation(parent: animation, curve: Curves.bounceOut),
                    ),
                    child: child,
                  );
                  /*return FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.bounceOut,
                      reverseCurve: Curves.bounceIn,
                    )),
                    child: child,
                  );*/
                },
              ),
            );
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

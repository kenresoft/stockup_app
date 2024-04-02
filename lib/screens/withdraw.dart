import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stockup_app/widgets/custom_keyboard.dart';

import '../shapes/withdraw_clip.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  bool isInputComplete = false;

  void handleKeyInput(String key) {
    if (key == 'delete') {
      // Handle delete button press
      for (int i = controllers.length - 1; i >= 0; i--) {
        if (controllers[i].text.isNotEmpty) {
          controllers[i].text = '';
          if (i >= 0) {
            FocusScope.of(context).requestFocus(focusNodes[i]);
          }
          break;
        }
      }
    } else {
      int emptyIndex = controllers.indexWhere((controller) => controller.text.isEmpty);
      if (emptyIndex != -1) {
        controllers[emptyIndex].text = key;
        if (emptyIndex + 1 < controllers.length) {
          FocusScope.of(context).requestFocus(focusNodes[emptyIndex + 1]);
        }
      }
    }

    setState(() {
      isInputComplete = controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xff84CEFE),
                height: 50.h,
              ),
              SizedBox(
                height: 330.h,
                child: Stack(
                  children: [
                    /// Background
                    Positioned(
                      top: 0,
                      height: 260.h,
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
                          children: [
                            InkWell(onTap: () => Navigator.pop(context), child: const Icon(CupertinoIcons.arrow_left)),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text('Withdraw', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Header
                    Positioned(
                      width: width,
                      top: (height * .2) / 2,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Text('Enter Amount', style: TextStyle(color: Color(0xff415663))),
                            Text('8,000.00', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),

                    /// Dashboard Head
                    Positioned(
                      width: width,
                      top: height * .23,
                      child: const SizedBox(
                        height: 30,
                        child: WithdrawClip(),
                      ),
                    ),

                    Positioned(
                      width: width,
                      top: height * .255,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              'Available balance',
                              style: TextStyle(color: Color(0xff858B8B)),
                            ),
                            Text('10,245.00', style: TextStyle(color: Color(0xff858B8B), fontSize: 19)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Withdraw money to',
                  style: TextStyle(color: Color(0xff858B8B), fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff3C3C3C), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    ClipOval(
                      child: CircleAvatar(
                        radius: 25,
                        child: Image(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.cover,
                          height: 50,
                        ),
                      ),
                    ),
                    SizedBox(width: 22),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Axis Bank',
                          style: TextStyle(color: Color(0xffBBBBBB), fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '*********5689',
                          style: TextStyle(color: Color(0xff858B8B), fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: width,
                child: const Text(
                  'Add new bank',
                  style: TextStyle(color: Color(0xff86CEFD), fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: width,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: FilledButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff86CEFD))),
                  onPressed: () {},
                  child: const Text(
                    'Withdraw',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomKeyboard(onKeyPressed: handleKeyInput),
              )
            ],
          ),
        ),
      ),
    );
  }
}

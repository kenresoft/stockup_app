import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stockup_app/widgets/custom_keyboard.dart';
import 'package:stockup_app/widgets/m_pin_image_avatar.dart';
import 'package:stockup_app/widgets/m_pin_text_field.dart';

class MPin extends StatefulWidget {
  const MPin({super.key});

  @override
  State<MPin> createState() => _MPinState();
}

class _MPinState extends State<MPin> {
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
        controllers[emptyIndex].text = key.replaceAll(RegExp(r'.'), '⁕');
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
    return Scaffold(
      backgroundColor: const Color(0xff131313),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 190.h,
              child: Stack(
                children: [
                  Container(
                    height: 130.h,
                    width: 1.sw,
                    color: const Color(0xff86CEFD),
                  ),
                  Positioned(
                    top: 70.h,
                    child: MPinImageAvatar(width: 1.sw),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.h),
                const Text(
                  'Welcome back,',
                  style: TextStyle(color: Color(0xff898989), letterSpacing: -.5),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Raxit Agrawal',
                  style: TextStyle(color: const Color(0xff86CEFD), fontSize: 20.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.h),
                Text(
                  'Enter 4 digit MPIN to login',
                  style: TextStyle(color: const Color(0xff898989), fontSize: 19.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                MPinTextField(controllers: controllers, focusNodes: focusNodes),
                SizedBox(height: 40.h),
                Text(
                  '$line    OR    $line',
                  style: const TextStyle(color: Color(0xff808080)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fingerprint,
                      color: const Color(0xff1CAB4E),
                      size: 30.r,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Unlock with fingerprint',
                      style: TextStyle(color: const Color(0xff898989), fontSize: 19.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                CustomKeyboard(onKeyPressed: handleKeyInput),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String get line => '- - - - - - - - - - - - - - -';
}

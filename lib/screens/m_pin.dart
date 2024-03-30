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
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: const Color(0xff131313),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1.05.sh,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 130.h,
                    color: const Color(0xff86CEFD),
                  ),
                ),
                Positioned(
                  top: 130.h,
                  bottom: 0,
                  child: SizedBox(
                    width: 1.sw,
                    child: Column(
                      children: [
                        SizedBox(height: 70.h),
                        const Text(
                          'Welcome back,',
                          style: TextStyle(color: Color(0xff898989)),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Raxit Agrawal',
                          style: TextStyle(color: const Color(0xff86CEFD), fontSize: 18.h, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 50.h),
                        Text(
                          'Enter 4 digit MPIN to login',
                          style: TextStyle(color: const Color(0xff898989), fontSize: 15.h, fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 30.h),

                        /// TextField
                        MPinTextField(height: 1.sh, width: 1.sw, controllers: controllers, focusNodes: focusNodes),

                        SizedBox(height: 30.h),
                        const Text('----- OR -----', style: TextStyle(color: Color(0xff808080))),
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
                              style: TextStyle(color: const Color(0xff898989), fontSize: 15.h, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        CustomKeyboard(onKeyPressed: handleKeyInput)
                      ],
                    ),
                  ),
                ),
                MPinImageAvatar(width: 1.sw),
              ],
            ),
          ),
        ),
      );
    });
  }
}

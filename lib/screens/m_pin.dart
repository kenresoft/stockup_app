import 'package:flutter/material.dart';
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff131313),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: 130,
              color: const Color(0xff86CEFD),
            ),
            Positioned(
              top: 130,
              bottom: 0,
              child: SizedBox(
                width: width,
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    const Text(
                      'Welcome back,',
                      style: TextStyle(color: Color(0xff898989)),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Raxit Agrawal',
                      style: TextStyle(color: Color(0xff86CEFD), fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Enter 4 digit MPIN to login',
                      style: TextStyle(color: Color(0xff898989), fontSize: 15, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 30),

                    /// TextField
                    MPinTextField(height: height, width: width, controllers: controllers, focusNodes: focusNodes),

                    const SizedBox(height: 30),
                    const Text('----- OR -----', style: TextStyle(color: Color(0xff808080))),
                    const SizedBox(height: 45),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fingerprint,
                          color: Color(0xff1CAB4E),
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Unlock with fingerprint',
                          style: TextStyle(color: Color(0xff898989), fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    CustomKeyboard(onKeyPressed: handleKeyInput)
                  ],
                ),
              ),
            ),
            MPinImageAvatar(width: width),
          ],
        ),
      ),
    );
  }
}

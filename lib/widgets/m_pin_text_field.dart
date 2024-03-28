import 'package:flutter/material.dart';

class MPinTextField extends StatelessWidget {
  const MPinTextField({
    super.key,
    required this.height,
    required this.width,
    required this.controllers,
    required this.focusNodes,
  });

  final double height;
  final double width;
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < controllers.length; i++)
          Container(
            width: height * 0.067,
            height: 80,
            margin: i <= 3 ? const EdgeInsets.only(right: 10) : const EdgeInsets.only(right: 0),
            child: TextFormField(
              controller: controllers[i],
              focusNode: focusNodes[i],
              maxLength: 1,
              keyboardType: TextInputType.none,
              onChanged: (value) {
                if (value.length > 1) {
                  controllers[i].text = value.substring(0, 1);
                }
              },
              style: const TextStyle(
                color: Color(0xFFEFEFEF),
                fontSize: 21,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.30,
              ),
              showCursor: false,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              obscureText: true,
              obscuringCharacter: '⁕',
              decoration: InputDecoration(
                counter: const Offstage(),
                filled: true,
                fillColor: const Color(0xFF282828),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Color(0x55555555)),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Color(0xFF2FA2B9)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

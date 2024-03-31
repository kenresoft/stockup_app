import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MPinTextField extends StatelessWidget {
  const MPinTextField({
    super.key,
    required this.controllers,
    required this.focusNodes,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < controllers.length; i++)
            Container(
              width: .14.sw,
              height: 83.h,
              margin: i <= 3 ? const EdgeInsets.only(right: 10).w : const EdgeInsets.only(right: 0),
              child: TextFormField(
                controller: controllers[i],
                focusNode: focusNodes[i],
                maxLength: 1,
                maxLines: null,  /// has to be null to apply expandable height.
                expands: true,
                keyboardType: TextInputType.none,
                onChanged: (value) {
                  if (value.length > 1) {
                    controllers[i].text = value.substring(0, 1);
                  }
                },
                style: TextStyle(
                  color: const Color(0xFFEFEFEF),
                  fontSize: 21.h,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.30.w,
                ),
                showCursor: false,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                /*obscureText: true,
                obscuringCharacter: '⁕',*/
                decoration: InputDecoration(
                  counter: const Offstage(),
                  filled: true,
                  fillColor: const Color(0xFF282828),
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Color(0x55555555)),
                    borderRadius: BorderRadius.circular(5).r,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Color(0xFF2FA2B9)),
                    borderRadius: BorderRadius.circular(5).r,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

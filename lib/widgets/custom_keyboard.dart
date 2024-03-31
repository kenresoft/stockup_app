import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomKeyboard extends StatefulWidget {
  final Function(String) onKeyPressed;

  const CustomKeyboard({super.key, required this.onKeyPressed});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  var colors = List.generate(12, (index) => const Color(0xff222222));
  var textColors = List.generate(12, (index) => const Color(0xffC5C5C5));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370.h,
      //height: .6.sh,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 12,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 15.w / 9.5.h,
        ),
        itemBuilder: (BuildContext context, int index) {
          Widget keyWidget = const SizedBox();
          if (index == 10) {
            /// Render '0' key
            keyWidget = buildKeyboardButton(index, '0', null);
          } else if (index == 9) {
            /// Render '*' key
            keyWidget;
          } else if (index == 11) {
            /// Render 'delete' key
            keyWidget = buildKeyboardButton(index, 'delete', CupertinoIcons.arrow_turn_up_left);
          } else {
            /// Render numeric keys 1-9
            keyWidget = buildKeyboardButton(index, null, null);
          }
          return keyWidget;
        },
      ),
    );
  }

  Widget buildKeyboardButton(int index, String? text, IconData? iconData) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors[index],
        borderRadius: BorderRadius.circular(5).r,
      ),
      margin: const EdgeInsets.all(5).r,
      child: InkWell(
        borderRadius: BorderRadius.circular(5).r,
        onTapDown: (details) {
          setState(() {
            colors[index] = const Color(0xffDDDDDD);
            textColors[index] = const Color(0xff262626);
          });
        },
        onTapUp: (details) {
          colors[index] = const Color(0xff222222);
          textColors[index] = const Color(0xffC5C5C5);
        },
        onTap: () => widget.onKeyPressed(text ?? '${index + 1}'),
        child: Container(
          alignment: Alignment.center,
          child: condition(
            iconData == null,
            Text(
              text ?? '${index + 1}',
              textAlign: TextAlign.center,
              style: TextStyle(color: textColors[index], fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            Icon(iconData, size: 25.sp, color: textColors[index]),
          ),
        ),
      ),
    );
  }
}

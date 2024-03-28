import 'package:flutter/material.dart';

class MPinImageAvatar extends StatelessWidget {
  const MPinImageAvatar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: const UnconstrainedBox(
          child: ClipOval(
            child: CircleAvatar(
              backgroundColor: Color(0xff040404),
              radius: 55,
              child: ClipOval(
                child: CircleAvatar(
                  radius: 48,
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage('assets/images/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

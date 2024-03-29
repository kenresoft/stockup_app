import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stockup_app/shapes/dashed_border_container.dart';
import 'package:stockup_app/shapes/dashed_line_spacer.dart';
import 'package:stockup_app/shapes/invite_clip.dart';

class Invite extends StatefulWidget {
  const Invite({super.key});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
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
                height: height * .05,
              ),
              SizedBox(
                height: height * .33,
                child: Stack(
                  children: [
                    /// Background
                    Positioned(
                      top: 0,
                      height: height * .26,
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
                              child: Text('Invite Friends', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Header
                    Positioned(
                      width: width,
                      top: (height * .2) / 2.4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            const Text(
                              'Refer Friend & Earn upto ₹500',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              width: width - 120,
                              child: const Text(
                                'Send a referral link to your friends via Whatsapp. Facebook and instagram.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xff415663)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Dashboard Head
                    Positioned(
                      width: width,
                      top: height * .259,
                      child: const SizedBox(
                        height: 70,
                        child: InviteClip(),
                      ),
                    ),

                    Positioned(
                      width: width,
                      top: height * .255,
                      child: const Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          child: Image(image: AssetImage('assets/images/profile.jpg')),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: DashedBorderContainer(
                  width: width / 1.5,
                  height: 59,
                  borderColor: const Color(0xff757575),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13).copyWith(left: 25),
                          decoration: const BoxDecoration(
                            color: Color(0xff222222),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'WER889CSDS',
                            style: TextStyle(color: Color(0xff86CEFD), fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xff121212),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: const Icon(Icons.copy, color: Color(0xff929292)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: width,
                child: const Text(
                  'Share via',
                  style: TextStyle(color: Color(0xffb2b2b2), fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                width: width,
                child: const DashedLineSpacer(),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Frequently Asked Questions:',
                  style: TextStyle(color: Color(0xffb2b2b2), fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: const Color(0xff121212),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const ExpansionTile(
                  shape: Border(),
                  tilePadding: EdgeInsets.zero,
                  trailing: Icon(CupertinoIcons.minus),

                  title: Text(
                    'What is Refer and Earn program?',
                    style: TextStyle(color: Color(0xffb2b2b2), fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Text(
                      'Our "Refer & Earn" program allows you to invite friends to join '
                      'our stock market app. When your friends sign up using your '
                      'unique referral code or link, both you and your friend can earn rewards.',
                      style: TextStyle(color: Color(0xff7C7C7C)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

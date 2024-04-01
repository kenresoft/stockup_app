import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stockup_app/shapes/dashed_border_container.dart';
import 'package:stockup_app/shapes/dashed_line_spacer.dart';
import 'package:stockup_app/shapes/invite_clip.dart';

import '../shapes/dashed_line_divider.dart';
import '../shapes/earnings_clip.dart';

class Invite extends StatefulWidget {
  const Invite({super.key});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 380.h,
                child: Stack(
                  children: [
                    /// Background
                    Positioned(
                      top: 0,
                      height: 310.h,
                      width: 1.sw,
                      child: Container(color: const Color(0xff84CEFE)),
                    ),

                    /// Toolbar
                    Positioned(
                      top: 60.h,
                      width: 1.sw,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30).w,
                        child: Row(
                          children: [
                            InkWell(onTap: () => Navigator.pop(context), child: const Icon(CupertinoIcons.arrow_left)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25).w,
                              child: const Text('Invite Friends', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Header
                    Positioned(
                      width: 1.sw,
                      top: 137.5.h,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30).w,
                        child: Column(
                          children: [
                            Text(
                              'Refer Friend & Earn upto ₹500',
                              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.h),
                              width: 1.sw - 120.w,
                              child: const Text(
                                'Send a referral link to your friends via Whatsapp. Facebook and instagram.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xff415663), fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Dashboard Head
                    Positioned(
                      width: 1.sw,
                      top: 309.h,
                      child: SizedBox(
                        height: 65.h,
                        child: const InviteClip(),
                      ),
                    ),

                    Positioned(
                      width: 1.sw,
                      top: 250.h,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image(
                          image: const AssetImage('assets/images/networking.png'),
                          height: 85.h,
                          width: 100.w,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60.h,
                      right: 0,
                      child: SizedBox(
                        width: 100.w,
                        height: 56.h,
                        child: InviteEarningsClip(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '₹1,000',
                                  style: TextStyle(color: const Color(0xff84CEFE), fontSize: 18.sp),
                                ),
                                const Text('Earnings', style: TextStyle(color: Color(0xff8b8b8b))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30).w,
                child: DashedBorderContainer(
                  width: 1.sw / 1.5,
                  height: 59.h,
                  borderColor: const Color(0xff757575),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13.h).copyWith(left: 25.w),
                          decoration: const BoxDecoration(color: Color(0xff222222)),
                          child: Text(
                            'WER889CSDS',
                            style: TextStyle(color: const Color(0xff86CEFD), fontWeight: FontWeight.bold, fontSize: 21.sp),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xff121212),
                        padding: const EdgeInsets.symmetric(horizontal: 15).w,
                        child: const Icon(Icons.copy, color: Color(0xff929292)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              SizedBox(
                width: 1.sw,
                child: Text(
                  'Share via',
                  style: TextStyle(color: const Color(0xffb2b2b2), fontSize: 15.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30).w,
                width: 1.sw,
                child: const DashedLineSpacer(),
              ),
              SizedBox(height: 40.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: const Text(
                  'Frequently Asked Questions:',
                  style: TextStyle(color: Color(0xffb2b2b2), fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                color: const Color(0xff121212),
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
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
              Container(
                width: 1.sw,
                margin: EdgeInsets.only(top: 5.h),
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: const DashedLineDivider(),
              ),
              Container(
                color: const Color(0xff121212),
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: const ExpansionTile(
                  shape: Border(),
                  tilePadding: EdgeInsets.zero,
                  trailing: Icon(CupertinoIcons.minus),
                  title: Text(
                    'How do I refer a friend to the app?',
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
              Container(
                width: 1.sw,
                margin: EdgeInsets.only(top: 5.h),
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: const DashedLineDivider(),
              ),
              Container(
                color: const Color(0xff121212),
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: const ExpansionTile(
                  shape: Border(),
                  tilePadding: EdgeInsets.zero,
                  trailing: Icon(CupertinoIcons.minus),
                  title: Text(
                    'When will I receive my referral rowards?',
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
              Container(
                width: 1.sw,
                margin: EdgeInsets.only(top: 5.h),
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: const DashedLineDivider(),
              ),
              Container(
                color: const Color(0xff121212),
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: const ExpansionTile(
                  shape: Border(),
                  tilePadding: EdgeInsets.zero,
                  trailing: Icon(CupertinoIcons.minus),
                  title: Text(
                    'What are the rewaras Tor parneiparng i me "Refer &',
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
              Container(
                width: 1.sw,
                margin: EdgeInsets.only(top: 5.h),
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: const DashedLineDivider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

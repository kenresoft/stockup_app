import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/transaction.dart';
import '../shapes/dashed_line_spacer.dart';
import '../shapes/funds_clip.dart';

class Funds extends StatefulWidget {
  const Funds({super.key});

  @override
  State<Funds> createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SingleChildScrollView(
        child: Column(
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
                            child: const Text('Funds', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Header
                  Positioned(
                    width: 1.sw,
                    top: 150.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30).w,
                      child: const Column(
                        children: [
                          Text('Total available balance', style: TextStyle(color: Color(0xff415663))),
                          Text('10,245.00', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),

                  /// Dashboard Head
                  Positioned(
                    width: 1.sw,
                    top: 269.9.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildBoardA(
                          1.sw,
                          1.sh,
                          const Color(0xff9CECAE),
                          CupertinoIcons.bag_badge_plus,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/withdraw'),
                          child: buildBoardA(
                            1.sw,
                            1.sh,
                            const Color(0xffECB39C),
                            CupertinoIcons.arrow_down_doc,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add Money', style: TextStyle(color: Colors.white, fontSize: 18.h)),
                  Text('Withdrawal', style: TextStyle(color: Colors.white, fontSize: 18.h)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 1.sw,
              margin: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 15.h),
              child: Transform(transform: Matrix4.identity()..rotateX(pi), child: const DashedLineSpacer()),
              //child: CustomPaint(painter: FundsDividerClip()),
            ),

            /// Dashboard Body
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(color: const Color(0xffBBBBBB), fontWeight: FontWeight.bold, fontSize: 16.h),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: const Color(0xffCFCFCF),
                    size: 23.h,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 1.sh / 2,
              child: ListView.builder(
                itemCount: transactions.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25).w,
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xff222222),
                      maxRadius: 25.r,
                      child: transactions[index].amount.contains('+')
                          ? const Icon(CupertinoIcons.bag_badge_plus, color: Color(0xff9CECAE))
                          : const Icon(CupertinoIcons.arrow_down_doc, color: Color(0xffECB39C)),
                    ),
                    title: Text(
                      transactions[index].amount.contains('+') ? 'Add Money' : 'Withdraw Money',
                      style: const TextStyle(color: Color(0xffBBBBBB), fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      transactions[index].date,
                      style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xff494949)),
                    ),
                    trailing: Text(
                      transactions[index].amount,
                      style: TextStyle(
                        fontSize: 16.h,
                        color: transactions[index].amount.contains('+') ? const Color(0xff9CECAE) : const Color(0xffD64F4F),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardA(double width, double height, Color bgColor, IconData iconData) {
    return SizedBox(
      width: width * 0.2,
      height: 110.h,
      child: CustomPaint(
        painter: FundsClip(bgColor),
        child: Icon(
          iconData,
          size: 45.r,
        ),
      ),
    );
  }

  final List<Transaction> transactions = [
    Transaction('12 June, 2023', '+ 2,000'),
    Transaction('02 June, 2023', '+ 4,000'),
    Transaction('25 May, 2023', '- 2,800'),
    Transaction('20 May. 2023', '+ 7,000'),
    Transaction('07 April, 2023', '+ 1,000'),
    Transaction('03 March, 2023', '- 9,000'),
  ];
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../shapes/dotted_line_painter.dart';
import '../shapes/funds_clip.dart';

class Funds extends StatefulWidget {
  const Funds({super.key});

  @override
  State<Funds> createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SingleChildScrollView(
        child: Column(
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
                            child: Text('Funds', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Header
                  Positioned(
                    width: width,
                    top: (height * .2) / 2,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Text('Total available balance', style: TextStyle(color: Color(0xff415663))),
                          Text('10,245.00', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),

                  /// Dashboard Head
                  Positioned(
                    width: width,
                    top: height * .2199,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildBoardA(
                          width,
                          height,
                          const Color(0xff9CECAE),
                          CupertinoIcons.bag_badge_plus,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/withdraw'),
                          child: buildBoardA(
                            width,
                            height,
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

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add Money', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('Withdrawal', style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 15),
              child: Transform(transform: Matrix4.identity()..rotateX(pi), child: const DottedLineWidget()),
              //child: CustomPaint(painter: FundsDividerClip()),
            ),

            /// Dashboard Body
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(color: Color(0xffBBBBBB), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xffCFCFCF),
                    size: 23,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height / 2,
              child: ListView.builder(
                itemCount: transactions.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xff222222),
                      maxRadius: 25,
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
                        fontSize: 16,
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
      height: height * 0.11,
      child: CustomPaint(
        painter: FundsClip(bgColor),
        child: Icon(
          iconData,
          size: 45,
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

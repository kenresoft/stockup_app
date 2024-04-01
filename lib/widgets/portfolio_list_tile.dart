import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stockup_app/models/watchlist.dart';

class PortfolioListTile extends StatefulWidget {
  const PortfolioListTile({
    super.key,
    required this.width,
    required this.index,
    required this.watchList,
  });

  final double width;
  final int index;

  final List<Watchlist> watchList;

  @override
  State<PortfolioListTile> createState() => _PortfolioListTileState();
}

class _PortfolioListTileState extends State<PortfolioListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 19.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.mail_outline, color: const Color(0xff7DC3F0), size: 18.r),
                  SizedBox(width: 6.w),
                  Text(
                    '${widget.watchList[widget.index].firstRowItems.$1}',
                    style: TextStyle(fontSize: 14.sp, color: const Color(0xff7DC3F0)),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Avg. ${widget.watchList[widget.index].firstRowItems.$2}',
                    style: TextStyle(fontSize: 14.sp, color: const Color(0xff696969), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '(${widget.watchList[widget.index].firstRowItems.$3}%)',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: condition(
                    '${widget.watchList[widget.index].firstRowItems.$3}'.contains('-'),
                    const Color(0xff963B3B),
                    const Color(0xff6DBF6C),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.watchList[widget.index].secondRowItems.$1,
                style: TextStyle(fontSize: 15.sp, color: const Color(0xffffffff), fontWeight: FontWeight.bold),
              ),
              Text(
                condition(
                  '${widget.watchList[widget.index].secondRowItems.$2}'.contains('-'),
                  '(- ${widget.watchList[widget.index].secondRowItems.$2}%)'.replaceAll('- -', '- '),
                  '+ ${widget.watchList[widget.index].secondRowItems.$2}%',
                ),
                style: TextStyle(
                    fontSize: 14.sp,
                    color: condition(
                      '${widget.watchList[widget.index].secondRowItems.$2}'.contains('-'),
                      const Color(0xffB94646),
                      const Color(0xff6DBF6C),
                    ),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Invested ${widget.watchList[widget.index].thirdRowItems.$1}',
                style: TextStyle(fontSize: 14.sp, color: const Color(0xff696969), fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'LTP',
                    style: TextStyle(fontSize: 14.sp, color: const Color(0xff696969), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '${widget.watchList[widget.index].thirdRowItems.$2}',
                    style: TextStyle(fontSize: 14.sp, color: const Color(0xff909090), fontWeight: FontWeight.w800),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    condition(
                      '${widget.watchList[widget.index].thirdRowItems.$3}'.contains('-'),
                      '(${widget.watchList[widget.index].thirdRowItems.$3}%)',
                      '(+ ${widget.watchList[widget.index].thirdRowItems.$3}%)',
                    ),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: condition(
                        '${widget.watchList[widget.index].thirdRowItems.$3}'.contains('-'),
                        const Color(0xff963B3B),
                        const Color(0xff6DBF6C),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

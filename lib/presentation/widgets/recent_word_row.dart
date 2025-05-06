import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldy/core/utils/colors.dart';
import 'package:worldy/presentation/widgets/pretty_time_text.dart';

class RecentWordRow extends StatelessWidget {
  final String word;
  final DateTime dateTime;
  final VoidCallback onTap;

  const RecentWordRow({super.key, required this.word, required this.onTap, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.w, right: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.search, color: AppColors.secondaryColor, size: 24.r),
            SizedBox(width: 32.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    word,
                    style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  PrettyTimeText(time: dateTime),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: AppColors.secondaryColor, size: 24.r),
          ],
        ),
      ),
    );
  }
}

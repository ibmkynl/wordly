import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../core/utils/colors.dart';

class PrettyTimeText extends StatelessWidget {
  final DateTime time;

  const PrettyTimeText({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(),
      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.secondaryTextColor),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  String _formatTime() {
    final now = DateTime.now();

    if (_isSameDay(now, time)) {
      return DateFormat('HH:mm').format(time);
    } else if (_isSameYear(now, time)) {
      return DateFormat('MMM d HH:mm').format(time);
    } else {
      return DateFormat('yyyy MMM d HH:mm').format(time);
    }
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isSameYear(DateTime a, DateTime b) {
    return a.year == b.year;
  }
}

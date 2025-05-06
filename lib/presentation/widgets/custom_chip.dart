import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldy/core/utils/extensions.dart';

import '../../core/utils/colors.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;

  const CustomChip({super.key, required this.text, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(64.r),
          border: Border.all(color: isSelected ? AppColors.blue : AppColors.borderColor),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Text(text.capitalizeFirst(), style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

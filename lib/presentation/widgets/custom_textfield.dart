import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextfield({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          hintStyle: TextStyle(color: AppColors.secondaryTextColor, fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
        style: TextStyle(color: AppColors.secondaryColor, fontSize: 17.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}

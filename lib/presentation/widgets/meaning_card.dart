import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldy/core/utils/extensions.dart';

import '../../core/utils/colors.dart';
import '../../domain/entities/meaning_entity.dart';

class MeaningCard extends StatelessWidget {
  final int index;
  final MeaningEntity meaning;

  const MeaningCard({super.key, required this.index, required this.meaning});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440.w,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      margin: EdgeInsets.only(bottom: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("${index.toString()} - ", style: TextStyle(fontSize: 18.sp)),
              Text(meaning.partOfSpeech.capitalizeFirst(), style: TextStyle(fontSize: 18.sp, color: AppColors.blue)),
            ],
          ),
          ...meaning.definitions
              .take(1)
              .map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Text(e.definition, style: TextStyle(fontSize: 12.sp)),
                    ),
                    if (e.example != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Example", style: TextStyle(fontSize: 12.sp)),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Text(
                              e.example!,
                              style: TextStyle(fontSize: 12.sp, color: AppColors.exampleTextColor),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/synonym_entity.dart';
import 'custom_chip.dart';

class SynonymCard extends StatelessWidget {
  final List<SynonymEntity> synonyms;

  const SynonymCard({super.key, required this.synonyms});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440.w,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Synonyms", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
          SizedBox(height: 15.h),
          Wrap(
            direction: Axis.horizontal,
            runSpacing: 10.h,
            spacing: 10.w,
            children: synonyms.take(5).map((e) => CustomChip(text: e.word)).toList(),
          ),
        ],
      ),
    );
  }
}

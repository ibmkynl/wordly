import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:worldy/presentation/providers/recent_search_provider.dart';
import 'package:worldy/presentation/widgets/error_text.dart';
import 'package:worldy/presentation/widgets/recent_word_row.dart';

import '../pages/word_detail_page.dart';

class RecentSearchList extends StatefulWidget {
  const RecentSearchList({super.key});

  @override
  State<RecentSearchList> createState() => _RecentSearchListState();
}

class _RecentSearchListState extends State<RecentSearchList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecentSearchProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        } else if (provider.errorMessage != null) {
          return Expanded(child: CustomErrorWidget(message: provider.errorMessage!));
        } else if (provider.recentSearchList.isEmpty) {
          return Expanded(
            child: Center(child: Text('No recent searches', style: TextStyle(fontSize: 14.sp, color: Colors.grey))),
          );
        }

        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 15.h),
            itemCount: provider.recentSearchList.length,
            itemBuilder: (context, index) {
              final item = provider.recentSearchList[index];
              return RecentWordRow(
                word: item.word,
                dateTime: item.searchedAt,
                onTap: () {
                  Navigator.push(context, WordDetailPage.route(item.word));
                },
              );
            },
          ),
        );
      },
    );
  }
}

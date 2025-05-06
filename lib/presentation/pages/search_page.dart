import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldy/core/utils/colors.dart';
import 'package:worldy/presentation/pages/favorites_page.dart';
import 'package:worldy/presentation/pages/word_detail_page.dart';
import 'package:worldy/presentation/widgets/custom_textfield.dart';
import 'package:worldy/presentation/widgets/recent_search_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static Route<dynamic> route() => MaterialPageRoute(builder: (_) => SearchPage());

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.push(context, FavoritesPage.route()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("Favorites"), Icon(Icons.chevron_right)],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: AppColors.secondaryColor, size: 24.r),
                      SizedBox(width: 8.w),
                      CustomTextfield(controller: searchController),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'Recent search',
                    style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500, color: AppColors.secondaryColor),
                  ),
                ),
                RecentSearchList(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () async {
                final word = searchController.text.trim();
                if (word.isEmpty) return;

                Navigator.push(context, WordDetailPage.route(word));
                searchController.clear();
              },
              child: Container(
                height: 85.h,
                width: 440.w,
                color: AppColors.blue,
                child: Center(
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

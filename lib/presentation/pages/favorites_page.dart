import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:worldy/presentation/pages/word_detail_page.dart';
import 'package:worldy/presentation/providers/favorites_provider.dart';
import 'package:worldy/presentation/widgets/favorite_word_row.dart';

import '../widgets/error_text.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => FavoritesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Favorites")),
      body: Consumer<FavoritesProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.errorMessage != null) {
            return CustomErrorWidget(message: provider.errorMessage!);
          } else if (provider.favorites.isEmpty) {
            return Center(child: Text('Favorites are empty.', style: TextStyle(fontSize: 14.sp, color: Colors.grey)));
          }

          return ListView.builder(
            itemCount: provider.favorites.length,
            itemBuilder: (context, index) {
              final model = provider.favorites[index];
              return FavoriteWordRow(
                word: model.word,
                dateTime: model.addedAt,
                onTap: () {
                  Navigator.push(context, WordDetailPage.route(model.word));
                },
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';

class FavoriteIcon extends StatelessWidget {
  final String word;

  const FavoriteIcon({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, provider, child) {
        final isFavorite = provider.isFavorite(word);

        return IconButton(
          onPressed: () => provider.handleFavoriteAction(word),
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        );
      },
    );
  }
}

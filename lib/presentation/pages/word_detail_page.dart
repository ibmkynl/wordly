import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:worldy/domain/entities/meaning_entity.dart';
import 'package:worldy/presentation/providers/word_detail_provider.dart';
import 'package:worldy/presentation/widgets/error_text.dart';
import 'package:worldy/presentation/widgets/favorite_icon.dart';
import 'package:worldy/presentation/widgets/meaning_card.dart';
import 'package:worldy/presentation/widgets/synonym_card.dart';
import 'package:worldy/presentation/widgets/word_card.dart';

class WordDetailPage extends StatefulWidget {
  final String word;

  const WordDetailPage({super.key, required this.word});

  static Route<dynamic> route(String word) => MaterialPageRoute(builder: (_) => WordDetailPage(word: word));

  @override
  State<WordDetailPage> createState() => _WordDetailPageState();
}

class _WordDetailPageState extends State<WordDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WordDetailProvider>().search(widget.word);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, actions: [FavoriteIcon(word: widget.word)]),
      body: Consumer<WordDetailProvider>(builder: (context, provider, _) => _buildBody(provider)),
    );
  }

  Widget _buildBody(WordDetailProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (provider.errorMessage != null) {
      return CustomErrorWidget(message: provider.errorMessage!);
    } else if (provider.searchedWord == null) {
      return Center(child: Text('Couldn\'t find the word', style: TextStyle(fontSize: 14.sp, color: Colors.grey)));
    }

    return SafeArea(
      child: ListView(
        children: [
          WordCard(wordEntity: provider.searchedWord!),
          ..._meaningList(_filteredMeanings(provider)),
          SynonymCard(synonyms: provider.synonyms),
        ],
      ),
    );
  }

  List<MeaningEntity> _filteredMeanings(WordDetailProvider provider) {
    final meanings = provider.searchedWord!.meanings;
    if (provider.selectedFilters.isEmpty) return meanings;

    return meanings.where((e) => provider.selectedFilters.contains(e.partOfSpeech)).toList();
  }

  List<Widget> _meaningList(List<MeaningEntity> meanings) {
    final grouped = <String, List<MeaningEntity>>{};

    for (var meaning in meanings) {
      grouped.putIfAbsent(meaning.partOfSpeech, () => []).add(meaning);
    }

    final sortedParts = grouped.keys.toList()..sort((a, b) => grouped[b]!.length.compareTo(grouped[a]!.length));

    return [
      for (final part in sortedParts)
        for (int i = 0; i < grouped[part]!.length; i++) MeaningCard(index: i + 1, meaning: grouped[part]![i]),
    ];
  }
}

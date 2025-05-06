import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:worldy/core/utils/colors.dart';
import 'package:worldy/core/utils/extensions.dart';
import 'package:worldy/domain/entities/word_entity.dart';
import 'package:worldy/presentation/providers/word_detail_provider.dart';
import 'package:worldy/presentation/widgets/circle_button.dart';
import 'package:worldy/presentation/widgets/custom_chip.dart';
import 'package:worldy/presentation/widgets/elevated_circle_icon_button.dart';

class WordCard extends StatefulWidget {
  final WordEntity wordEntity;

  const WordCard({super.key, required this.wordEntity});

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  late final AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  bool get _canPlay => widget.wordEntity.phonetics.any((e) => e.audio.isNotEmpty);

  Future<void> _play() async {
    try {
      final url = widget.wordEntity.phonetics.firstWhere((e) => e.audio.isNotEmpty).audio;
      await _player.setUrl(url);
      await _player.play();
    } catch (e) {
      debugPrint('Audio play error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<WordDetailProvider>();
    final partOfSpeech = widget.wordEntity.meanings.map((e) => e.partOfSpeech).toSet();

    return Container(
      padding: EdgeInsets.all(20.r),
      color: AppColors.secondaryBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildHeader(provider), SizedBox(height: 12.h), _buildChips(provider, partOfSpeech)],
      ),
    );
  }

  Widget _buildHeader(WordDetailProvider provider) {
    final phoneticText = widget.wordEntity.phonetics.firstOrNull?.text ?? '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.wordEntity.word.capitalizeFirst(), style: TextStyle(fontSize: 34.sp)),
            if (phoneticText.isNotEmpty) Text(phoneticText),
          ],
        ),
        if (_canPlay) ElevatedCircleIconButton(icon: Icons.hearing, onTap: _play),
      ],
    );
  }

  Widget _buildChips(WordDetailProvider provider, Set<String> parts) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: [
        if (provider.selectedFilters.isNotEmpty) CircleButton(icon: Icons.close, onTap: () => provider.clearFilters()),
        ...parts.map(
          (e) => CustomChip(
            text: e,
            onTap: () => provider.selectFilter(e),
            isSelected: provider.selectedFilters.contains(e),
          ),
        ),
      ],
    );
  }
}

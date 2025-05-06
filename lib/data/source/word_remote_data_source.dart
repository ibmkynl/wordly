import 'package:flutter/cupertino.dart';

import '../../core/consts/contants.dart';
import '../../core/error/failure.dart';
import '../../core/network/api_client.dart';
import '../models/synonym_model.dart';
import '../models/word_model.dart';

abstract class WordRemoteDataSource {
  Future<WordModel> fetchWordDetails(String word);

  Future<List<SynonymModel>> fetchSynonyms(String word);
}

class WordRemoteDataSourceImpl implements WordRemoteDataSource {
  final ApiClient client;

  WordRemoteDataSourceImpl(this.client);

  @override
  Future<WordModel> fetchWordDetails(String word) async {
    try {
      final response = await client.get('${Constants.wordUrl}$word');
      final data = response.data as List;
      return WordModel.fromJson(data[0]);
    } on Failure catch (failure) {
      debugPrint("Error at fetchWordDetails: ${failure.message}");
      rethrow;
    }
  }

  @override
  Future<List<SynonymModel>> fetchSynonyms(String word) async {
    try {
      final response = await client.get(Constants.synonymUrl, queryParameters: {'rel_syn': word});
      final data = response.data as List;
      return data.map((e) => SynonymModel.fromJson(e)).toList();
    } on Failure catch (failure) {
      debugPrint("Error at fetchWordDetails: ${failure.message}");
      rethrow;
    }
  }
}

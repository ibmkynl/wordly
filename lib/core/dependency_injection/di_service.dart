import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:worldy/data/repo/favorite_repository_impl.dart';
import 'package:worldy/data/source/recent_search_local_data_source.dart';
import 'package:worldy/domain/repositories/favorites_repository.dart';
import 'package:worldy/domain/repositories/search_repository.dart';
import 'package:worldy/domain/usecases/get_recent_searches_usecase.dart';
import 'package:worldy/domain/usecases/get_word_detail_usecase.dart';
import 'package:worldy/domain/usecases/get_word_synonyms_usecase.dart';
import 'package:worldy/domain/usecases/manage_favorites_usecase.dart';
import 'package:worldy/presentation/providers/favorites_provider.dart';
import 'package:worldy/presentation/providers/recent_search_provider.dart';

import '../../data/repo/dictionary_repository_impl.dart';
import '../../data/repo/search_repository_impl.dart';
import '../../data/source/favorite_local_data_source.dart';
import '../../data/source/word_local_data_source.dart';
import '../../data/source/word_remote_data_source.dart';
import '../../domain/repositories/dictionary_repository.dart';
import '../network/api_client.dart';
import '../storage/hive_service.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton(() => ApiClient(dio: Dio()));
  sl.registerLazySingleton(() => HiveService());

  // Data Sources
  sl.registerLazySingleton<WordLocalDataSource>(() => WordLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<WordRemoteDataSource>(() => WordRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<RecentSearchLocalDataSource>(() => RecentSearchLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<FavoriteLocalDataSource>(() => FavoriteLocalDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<DictionaryRepository>(() => DictionaryRepoImpl(remote: sl(), local: sl()));
  sl.registerLazySingleton<RecentSearchRepository>(() => RecentSearchRepoImpl(sl()));
  sl.registerLazySingleton<FavoritesRepository>(() => FavoriteRepoImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => RecentSearchUseCase(sl()));
  sl.registerLazySingleton(() => GetWordSynonymsUseCase(sl()));
  sl.registerLazySingleton(() => GetWordDetailsUseCase(sl()));
  sl.registerLazySingleton(() => FavoritesUseCase(sl()));

  // Providers
  sl.registerFactory(() => RecentSearchProvider(recentSearchUseCase: sl()));
  sl.registerFactory(() => FavoritesProvider(favoritesUseCase: sl()));
}

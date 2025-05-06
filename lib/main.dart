import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:worldy/presentation/pages/splash_page.dart';
import 'package:worldy/presentation/providers/favorites_provider.dart';
import 'package:worldy/presentation/providers/recent_search_provider.dart';
import 'package:worldy/presentation/providers/word_detail_provider.dart';

import 'core/dependency_injection/di_service.dart';
import 'data/models/definition_model.dart';
import 'data/models/favorite_word_model.dart';
import 'data/models/meaning_model.dart';
import 'data/models/phonetic_model.dart';
import 'data/models/recent_search_model.dart';
import 'data/models/synonym_model.dart';
import 'data/models/word_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  registerHiveAdapters();

  await initDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MyApp());
}

void registerHiveAdapters() {
  Hive.registerAdapter(PhoneticModelAdapter());
  Hive.registerAdapter(DefinitionModelAdapter());
  Hive.registerAdapter(MeaningModelAdapter());
  Hive.registerAdapter(WordModelAdapter());
  Hive.registerAdapter(SynonymModelAdapter());
  Hive.registerAdapter(RecentSearchModelAdapter());
  Hive.registerAdapter(FavoriteWordModelAdapter());
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<FavoritesProvider>()),
        ChangeNotifierProvider(create: (_) => sl<RecentSearchProvider>()),
        ChangeNotifierProvider(
          create:
              (context) => WordDetailProvider(
                getWordDetailsUseCase: sl(),
                getTopSynonymsUseCase: sl(),
                recentSearchProvider: context.read<RecentSearchProvider>(),
              ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(440, 956),
        minTextAdapt: true,
        builder: (context, widget) {
          return MaterialApp(
            title: 'Worldy',
            navigatorKey: MyApp.navigatorKey,
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        },
      ),
    );
  }
}

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviex/data/models/film_local.dart';
import 'package:moviex/di/inject.dart';
import 'package:moviex/firebase_options.dart';
import 'package:moviex/presentation/pages/splash/splash_page.dart';
import 'package:moviex/utils/theme.dart';
import 'presentation/blocs/film/film_bloc.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
    Hive.registerAdapter(FilmLocalAdapter());
    await configureDependencies();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(const Application());
  }, (error, stackTrace) async {
    await FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: 'Uncaught Error',
    );
  });
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late Box _boxMovies;

  _openBox() async => _boxMovies = await Hive.openBox('watchlist');

  _closeBox() async => await _boxMovies.close();

  @override
  void initState() {
    _openBox();
    super.initState();
  }

  @override
  void dispose() {
    _closeBox();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => inject<FilmBloc>()))],
      child: MaterialApp(
        home: const SplashPage(),
        theme: ThemeData.dark().copyWith(colorScheme: darkColorScheme),
      ),
    );
  }
}

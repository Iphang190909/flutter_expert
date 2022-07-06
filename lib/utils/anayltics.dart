import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Anayltics {
  final analytics = FirebaseAnalytics.instance;

  void goToDetailEvent(String filmType, String idFilm) async {
    await analytics.logEvent(name: 'GoToDetail', parameters: {
      'content': filmType,
      'idFilm': idFilm,
    });
  }
}

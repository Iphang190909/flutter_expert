import 'package:injectable/injectable.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/domain/repositories/film_repository.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/state/remote_state.dart';

@lazySingleton
class GetFilmRecommendation {
  final FilmRepository repo;

  const GetFilmRecommendation(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type, int id) async {
    return await repo.getRecommendations(type, id);
  }
}

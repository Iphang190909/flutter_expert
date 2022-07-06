import 'package:injectable/injectable.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/domain/repositories/film_repository.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/state/remote_state.dart';

@lazySingleton
class SearchFilm {
  final FilmRepository repo;

  const SearchFilm(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type, String query) async {
    return await repo.search(type, query);
  }
}

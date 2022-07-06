import 'package:injectable/injectable.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/domain/repositories/film_repository.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/state/remote_state.dart';

@lazySingleton
class GetFilmDetail {
  final FilmRepository repo;

  const GetFilmDetail(this.repo);

  Future<RemoteState<Film>> execute(FilmType type, int id) async =>
      await repo.getDetail(type, id);
}

import 'package:injectable/injectable.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/domain/repositories/film_repository.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/state/remote_state.dart';

@lazySingleton
class AddWatchlist {
  final FilmRepository repo;

  const AddWatchlist(this.repo);

  Future<RemoteState<bool>> execute(FilmType type, Film film) async {
    return await repo.addWatchlist(type, film);
  }
}

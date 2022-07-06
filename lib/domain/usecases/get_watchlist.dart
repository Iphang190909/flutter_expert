import 'package:injectable/injectable.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/domain/repositories/film_repository.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/state/remote_state.dart';

@lazySingleton
class GetWatchlist {
  final FilmRepository repo;

  const GetWatchlist(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type) async {
    return await repo.getWatchlist(type);
  }
}

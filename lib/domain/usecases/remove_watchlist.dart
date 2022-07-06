import 'package:injectable/injectable.dart';
import 'package:moviex/domain/repositories/film_repository.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/state/remote_state.dart';

@lazySingleton
class RemoveWatchlist {
  final FilmRepository repo;

  const RemoveWatchlist(this.repo);

  Future<RemoteState<bool>> execute(FilmType type, int id) async {
    return await repo.removeWatchlist(type, id);
  }
}

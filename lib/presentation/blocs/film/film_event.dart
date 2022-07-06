part of 'film_bloc.dart';

@freezed
class FilmEvent with _$FilmEvent {
  const factory FilmEvent.watchlistCheckEvent({required Film thisFilm}) =
      WatchlistCheckEvent;
  const factory FilmEvent.fetchMainPageEvent() = FetchMainPageEvent;
  const factory FilmEvent.getTopMovieFilmEvent() = GetTopMovieFilmEvent;
  const factory FilmEvent.getTopTvFilmEvent() = GetTopTvFilmEvent;
  const factory FilmEvent.getNowPlayingMovieFilmEvent() =
      GetNowPlayingMovieFilmEvent;
  const factory FilmEvent.getNowPlayingTvFilmEvent() = GetNowPlayingTvFilmEvent;
  const factory FilmEvent.getPopularMovieFilmEvent() = GetPopularMovieFilmEvent;
  const factory FilmEvent.getPopularTvFilmEvent() = GetPopularTvFilmEvent;
  const factory FilmEvent.goToListPage({
    required FilmType filmType,
    required String filmSectionType,
    required List<Film> films,
  }) = GoToListPageEvent;
  const factory FilmEvent.getDetail({
    required FilmType type,
    required int id,
  }) = GetDetailEvent;
  const factory FilmEvent.getRecommendations({
    required FilmType type,
    required int id,
  }) = GetRecommendationsEvent;
  const factory FilmEvent.searchFilm({
    required FilmType type,
    required String query,
  }) = SearchFilmEvent;
  // Watchlist
  const factory FilmEvent.getWatchlist({required FilmType type}) =
      GetWatchListEvent;
  const factory FilmEvent.addToWatchlist({
    required FilmType type,
    required Film film,
  }) = AddToWatchListEvent;
  const factory FilmEvent.getExistWatchlist({
    required FilmType type,
    required int id,
  }) = GetExistWatchListEvent;
  const factory FilmEvent.removeFilmFromWatchlist({
    required FilmType type,
    required int id,
  }) = RemoveFilmFromWatchListEvent;

  const factory FilmEvent.changeMainPageTab({required int index}) =
      ChangeMainPageTabEvent;
}

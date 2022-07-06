part of 'film_bloc.dart';

@freezed
class FilmState with _$FilmState {
  const factory FilmState({
    // Watchlist
    required bool isExistedInWatchlist,
    required bool isSuccessRemoveFilmFromWatchlist,

    // States
    required ViewState nowPlayingMovieFilmViewState,
    required ViewState popularMovieFilmViewState,
    required ViewState topMovieFilmViewState,
    required ViewState nowPlayingTvFilmViewState,
    required ViewState popularTvFilmViewState,
    required ViewState topTvFilmViewState,
    required ViewState detailFilmViewState,
    required ViewState recommendationFilmViewState,
    required ViewState searchFilmViewState,
    required ViewState watchListFilmViewState,

    // MainPage tab index
    required int mainPageTabIndex,

    // Data
    required List<Film> listPageFilm,
    required FilmType listPageFilmType,
    required String listPageFilmSectionType,
    required String searchQuery,
    required List<Film> nowPlayingMovieFilm,
    required List<Film> popularMovieFilm,
    required List<Film> topMovieFilm,
    required List<Film> nowPlayingTvFilm,
    required List<Film> popularTvFilm,
    required List<Film> topTvFilm,
    required Film detailFilm,
    required List<Film> recommendationFilm,
    required List<Film> searchFilm,
    required List<Film> watchListFilm,
  }) = _FilmState;

  factory FilmState.initial() => FilmState(
        // Watchlist
        isSuccessRemoveFilmFromWatchlist: false,
        isExistedInWatchlist: false,

        // Data
        searchQuery: '',
        watchListFilm: [],
        recommendationFilm: [],
        listPageFilm: [],
        listPageFilmType: FilmType.movie,
        listPageFilmSectionType: '',
        detailFilm: Film(
          id: 0,
          name: '',
          voteAverage: 0,
          posterPath: '',
          overview: '',
          type: FilmType.movie,
        ),
        nowPlayingMovieFilm: [],
        popularMovieFilm: [],
        topMovieFilm: [],
        nowPlayingTvFilm: [],
        popularTvFilm: [],
        topTvFilm: [],
        searchFilm: [],

        // States
        nowPlayingMovieFilmViewState: const ViewState.initial(),
        popularMovieFilmViewState: const ViewState.initial(),
        topMovieFilmViewState: const ViewState.initial(),
        nowPlayingTvFilmViewState: const ViewState.initial(),
        popularTvFilmViewState: const ViewState.initial(),
        topTvFilmViewState: const ViewState.initial(),
        detailFilmViewState: const ViewState.initial(),
        recommendationFilmViewState: const ViewState.initial(),
        searchFilmViewState: const ViewState.initial(),
        watchListFilmViewState: const ViewState.initial(),

        // MainPage tab index
        mainPageTabIndex: 0,
      );
}

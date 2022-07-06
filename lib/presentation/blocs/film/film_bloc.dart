import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/domain/usecases/add_watchlist.dart';
import 'package:moviex/domain/usecases/get_film_detail.dart';
import 'package:moviex/domain/usecases/get_film_now_playing.dart';
import 'package:moviex/domain/usecases/get_film_popular.dart';
import 'package:moviex/domain/usecases/get_film_recommendation.dart';
import 'package:moviex/domain/usecases/get_film_top_rated.dart';
import 'package:moviex/domain/usecases/get_watchlist.dart';
import 'package:moviex/domain/usecases/get_watchlist_exist.dart';
import 'package:moviex/domain/usecases/remove_watchlist.dart';
import 'package:moviex/domain/usecases/search_film.dart';
import 'package:moviex/state/view_state.dart';
import 'package:moviex/utils/enum.dart';

part 'film_event.dart';
part 'film_state.dart';
part 'film_bloc.freezed.dart';

@lazySingleton
class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final GetFilmNowPlaying getFilmNowPlaying;
  final GetFilmPopular getFilmPopular;
  final GetFilmTopRated getFilmTopRated;
  final GetFilmDetail getFilmDetail;
  final GetFilmRecommendation getFilmRecommendation;
  final SearchFilm searchFilm;
  final GetWatchlist getWatchlist;
  final AddWatchlist addWatchlist;
  final GetWatchlistExist getWatchlistExist;
  final RemoveWatchlist removeFilmFromWatchlist;

  FilmBloc(
    this.getFilmNowPlaying,
    this.getFilmPopular,
    this.getFilmTopRated,
    this.getFilmDetail,
    this.getFilmRecommendation,
    this.searchFilm,
    this.getWatchlist,
    this.addWatchlist,
    this.getWatchlistExist,
    this.removeFilmFromWatchlist,
  ) : super(FilmState.initial()) {
    on<FilmEvent>(_mapToEvent);
  }

  Future<void> _mapToEvent(FilmEvent events, Emitter<FilmState> emit) async {
    await events.map(
      fetchMainPageEvent: (event) => _handleFetchMainPageEvent(event, emit),
      getDetail: (event) => _handleGetFilmDetailEvent(event, emit),
      getRecommendations: (event) =>
          _handleGetFilmRecommendationEvent(event, emit),
      searchFilm: (event) => _handleGetSearchFilmEvent(event, emit),
      getWatchlist: (event) => _handleGetWatchListFilmEvent(event, emit),
      addToWatchlist: (event) => _handleAddToWatchlistEvent(event, emit),
      getExistWatchlist: (event) => _handleGetExistWatchlistEvent(event, emit),
      removeFilmFromWatchlist: (event) =>
          _handleRemoveWatchlistEvent(event, emit),
      changeMainPageTab: (event) => _handleChangeMainPageTabEvent(event, emit),
      goToListPage: (event) => _handleGoToListPageEvent(event, emit),
      getNowPlayingMovieFilmEvent: (event) =>
          _handleGetNowPlayingMovieFilmEvent(event, emit),
      getNowPlayingTvFilmEvent: (event) =>
          _handleGetNowPlayingTvFilmEvent(event, emit),
      getPopularMovieFilmEvent: (event) =>
          _handleGetPopularMovieFilmEvent(event, emit),
      getPopularTvFilmEvent: (event) =>
          _handleGetPopularTvFilmEvent(event, emit),
      getTopMovieFilmEvent: (event) => _handleGetTopMovieFilmEvent(event, emit),
      getTopTvFilmEvent: (event) => _handleGetTopTvFilmEvent(event, emit),
      watchlistCheckEvent: (event) => _handleWatchlistCheckEvent(event, emit),
    );
  }

  Future<void> _handleWatchlistCheckEvent(
      WatchlistCheckEvent event, Emitter<FilmState> emit) async {
    emit(state.copyWith(
        isExistedInWatchlist: state.watchListFilm.contains(event.thisFilm)));
  }

  Future<void> _handleGoToListPageEvent(
    GoToListPageEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(state.copyWith(
      listPageFilm: event.films,
      listPageFilmType: event.filmType,
      listPageFilmSectionType: event.filmSectionType,
    ));
  }

  Future<void> _handleChangeMainPageTabEvent(
    ChangeMainPageTabEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(state.copyWith(mainPageTabIndex: event.index));
  }

  Future<void> _handleFetchMainPageEvent(
    FetchMainPageEvent event,
    Emitter<FilmState> emit,
  ) async {
    add(const GetNowPlayingTvFilmEvent());
    add(const GetNowPlayingMovieFilmEvent());

    add(const GetPopularTvFilmEvent());
    add(const GetPopularMovieFilmEvent());

    add(const GetTopTvFilmEvent());
    add(const GetTopMovieFilmEvent());
  }

  Future<void> _handleGetTopMovieFilmEvent(
      GetTopMovieFilmEvent event, Emitter<FilmState> emit) async {
    emit(state.copyWith(
      topMovieFilmViewState: const ViewState.loading(),
    ));

    final movieResult =
        await getFilmTopRated.execute(FilmType.movie).then((value) => value);

    movieResult.when(
      success: (movieFilms) {
        emit(state.copyWith(
          topMovieFilmViewState: const ViewState.success(),
          topMovieFilm: movieFilms,
        ));
      },
      error: (message) => emit(state.copyWith(
        topMovieFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetTopTvFilmEvent(
      GetTopTvFilmEvent event, Emitter<FilmState> emit) async {
    emit(state.copyWith(
      topTvFilmViewState: const ViewState.loading(),
    ));

    final tvResult = await getFilmTopRated.execute(FilmType.tv);

    tvResult.when(
      success: (movieFilms) => emit(state.copyWith(
        topTvFilmViewState: const ViewState.success(),
        topTvFilm: movieFilms,
      )),
      error: (message) => emit(state.copyWith(
        topTvFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetNowPlayingMovieFilmEvent(
    GetNowPlayingMovieFilmEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(state.copyWith(
      nowPlayingMovieFilmViewState: const ViewState.loading(),
    ));

    final movieResult = await getFilmNowPlaying.execute(FilmType.movie);

    movieResult.when(
      success: (movieFilms) {
        emit(state.copyWith(
          nowPlayingMovieFilmViewState: const ViewState.success(),
          nowPlayingMovieFilm: movieFilms,
        ));
      },
      error: (message) => emit(state.copyWith(
        nowPlayingMovieFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetNowPlayingTvFilmEvent(
    GetNowPlayingTvFilmEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(state.copyWith(
      nowPlayingTvFilmViewState: const ViewState.loading(),
    ));

    final tvResult = await getFilmNowPlaying.execute(FilmType.tv);

    tvResult.when(
      success: (tvFilms) => emit(state.copyWith(
        nowPlayingTvFilmViewState: const ViewState.success(),
        nowPlayingTvFilm: tvFilms,
      )),
      error: (message) => emit(state.copyWith(
        nowPlayingTvFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetPopularMovieFilmEvent(
      GetPopularMovieFilmEvent event, Emitter<FilmState> emit) async {
    emit(state.copyWith(
      popularMovieFilmViewState: const ViewState.loading(),
    ));

    final movieResult = await getFilmPopular.execute(FilmType.movie);

    movieResult.when(
      success: (movieFilms) => emit(state.copyWith(
        popularMovieFilmViewState: const ViewState.success(),
        popularMovieFilm: movieFilms,
      )),
      error: (message) => emit(state.copyWith(
        popularMovieFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetPopularTvFilmEvent(
      GetPopularTvFilmEvent event, Emitter<FilmState> emit) async {
    emit(state.copyWith(
      popularTvFilmViewState: const ViewState.loading(),
    ));

    final tvResult = await getFilmPopular.execute(FilmType.tv);

    tvResult.when(
      success: (tvFilms) {
        emit(state.copyWith(
          popularTvFilmViewState: const ViewState.success(),
          popularTvFilm: tvFilms,
        ));
      },
      error: (message) => emit(state.copyWith(
        popularTvFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetFilmDetailEvent(
    GetDetailEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(state.copyWith(detailFilmViewState: const ViewState.loading()));
    final result = await getFilmDetail.execute(event.type, event.id);

    result.when(
      success: (film) => emit(state.copyWith(
        detailFilmViewState: const ViewState.success(),
        detailFilm: film,
      )),
      error: (message) => emit(state.copyWith(
        detailFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetFilmRecommendationEvent(
    GetRecommendationsEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(
      state.copyWith(recommendationFilmViewState: const ViewState.loading()),
    );
    final result = await getFilmRecommendation.execute(event.type, event.id);

    result.when(
      success: (films) => emit(state.copyWith(
        recommendationFilmViewState: const ViewState.success(),
        recommendationFilm: films,
      )),
      error: (message) => emit(state.copyWith(
        recommendationFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetSearchFilmEvent(
    SearchFilmEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(state.copyWith(
      searchQuery: event.query,
      searchFilmViewState: const ViewState.loading(),
    ));

    final result = await searchFilm.execute(event.type, event.query);

    result.when(
      success: (films) {
        emit(state.copyWith(
          searchFilmViewState: const ViewState.success(),
          searchFilm: films,
        ));
      },
      error: (message) {
        emit(state.copyWith(
          searchFilmViewState: const ViewState.error(),
        ));
      },
    );
  }

  Future<void> _handleGetWatchListFilmEvent(
    GetWatchListEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(state.copyWith(watchListFilmViewState: const ViewState.loading()));

    final result = await getWatchlist.execute(event.type);

    result.when(
      success: (films) => emit(state.copyWith(
        watchListFilmViewState: const ViewState.success(),
        watchListFilm: films,
      )),
      error: (message) => emit(state.copyWith(
        watchListFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleAddToWatchlistEvent(
    AddToWatchListEvent event,
    Emitter<FilmState> emit,
  ) async {
    emit(state.copyWith(watchListFilmViewState: const ViewState.loading()));

    final result = await addWatchlist.execute(event.type, event.film);

    result.when(
      success: (films) => emit(state.copyWith(
        watchListFilmViewState: const ViewState.success(),
      )),
      error: (message) => emit(state.copyWith(
        watchListFilmViewState: const ViewState.error(),
      )),
    );
  }

  Future<void> _handleGetExistWatchlistEvent(
    GetExistWatchListEvent event,
    Emitter<FilmState> emit,
  ) async {
    final result = await getWatchlistExist.execute(event.type, event.id);

    result.when(
      success: (status) => emit(
        state.copyWith(isExistedInWatchlist: status),
      ),
      error: (message) => emit(
        state.copyWith(isExistedInWatchlist: false),
      ),
    );
  }

  Future<void> _handleRemoveWatchlistEvent(
    RemoveFilmFromWatchListEvent event,
    Emitter<FilmState> emit,
  ) async {
    final result = await removeFilmFromWatchlist.execute(event.type, event.id);

    result.when(
      success: (status) => emit(
        state.copyWith(isSuccessRemoveFilmFromWatchlist: status),
      ),
      error: (message) => emit(
        state.copyWith(
          isSuccessRemoveFilmFromWatchlist: false,
        ),
      ),
    );
  }
}

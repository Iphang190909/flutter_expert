// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/datasources/local_data_source.dart' as _i6;
import '../data/repositories/datasources/remote_data_source.dart' as _i7;
import '../data/repositories/film_repository_impl.dart' as _i9;
import '../domain/repositories/film_repository.dart' as _i8;
import '../domain/usecases/add_watchlist.dart' as _i19;
import '../domain/usecases/get_film_detail.dart' as _i10;
import '../domain/usecases/get_film_now_playing.dart' as _i11;
import '../domain/usecases/get_film_popular.dart' as _i12;
import '../domain/usecases/get_film_recommendation.dart' as _i13;
import '../domain/usecases/get_film_top_rated.dart' as _i14;
import '../domain/usecases/get_watchlist.dart' as _i15;
import '../domain/usecases/get_watchlist_exist.dart' as _i16;
import '../domain/usecases/remove_watchlist.dart' as _i17;
import '../domain/usecases/search_film.dart' as _i18;
import '../presentation/blocs/film/film_bloc.dart' as _i20;
import '../utils/anayltics.dart' as _i3;
import 'modules/inject_module.dart'
    as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectModules = _$InjectModules();
  gh.lazySingleton<_i3.Anayltics>(() => _i3.Anayltics());
  gh.lazySingleton<_i4.Box<dynamic>>(() => injectModules.box);
  await gh.lazySingletonAsync<_i5.Dio>(() => injectModules.client,
      preResolve: true);
  gh.lazySingleton<_i6.LocalDataSource>(
      () => _i6.LocalDataSource(get<_i4.Box<dynamic>>()));
  gh.lazySingleton<_i7.RemoteDataSource>(
      () => _i7.RemoteDataSource(get<_i5.Dio>()));
  gh.lazySingleton<_i8.FilmRepository>(() => _i9.FilmRepositoryImpl(
      get<_i7.RemoteDataSource>(), get<_i6.LocalDataSource>()));
  gh.lazySingleton<_i10.GetFilmDetail>(
      () => _i10.GetFilmDetail(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i11.GetFilmNowPlaying>(
      () => _i11.GetFilmNowPlaying(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i12.GetFilmPopular>(
      () => _i12.GetFilmPopular(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i13.GetFilmRecommendation>(
      () => _i13.GetFilmRecommendation(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i14.GetFilmTopRated>(
      () => _i14.GetFilmTopRated(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i15.GetWatchlist>(
      () => _i15.GetWatchlist(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i16.GetWatchlistExist>(
      () => _i16.GetWatchlistExist(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i17.RemoveWatchlist>(
      () => _i17.RemoveWatchlist(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i18.SearchFilm>(
      () => _i18.SearchFilm(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i19.AddWatchlist>(
      () => _i19.AddWatchlist(get<_i8.FilmRepository>()));
  gh.lazySingleton<_i20.FilmBloc>(() => _i20.FilmBloc(
      get<_i11.GetFilmNowPlaying>(),
      get<_i12.GetFilmPopular>(),
      get<_i14.GetFilmTopRated>(),
      get<_i10.GetFilmDetail>(),
      get<_i13.GetFilmRecommendation>(),
      get<_i18.SearchFilm>(),
      get<_i15.GetWatchlist>(),
      get<_i19.AddWatchlist>(),
      get<_i16.GetWatchlistExist>(),
      get<_i17.RemoveWatchlist>()));
  return get;
}

class _$InjectModules extends _i21.InjectModules {}

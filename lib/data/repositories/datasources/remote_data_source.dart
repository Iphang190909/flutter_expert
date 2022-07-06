import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:moviex/data/models/film_model.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/utils/exception.dart';

@lazySingleton
class RemoteDataSource {
  final Dio _client;
  const RemoteDataSource(this._client);

  Future<FilmModel> getDetail(FilmType type, int id) async {
    try {
      final response = await _client.get('${type.endpoint()}/$id');
      final result = FilmModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return result;
    } catch (e) {
      throw const DatasourceException();
    }
  }

  Future<List<FilmModel>> getNowPlaying(FilmType type) async {
    try {
      var path = '${type.endpoint()}/airing_today';
      if (type == FilmType.movie) {
        path = '${type.endpoint()}/now_playing';
      }
      final response = await _client.get(path);
      final result = (response.data['results'] as List).map((e) {
        return FilmModel.fromJson(e);
      }).toList();
      return result;
    } catch (e) {
      throw const DatasourceException();
    }
  }

  Future<List<FilmModel>> getPopular(FilmType type) async {
    try {
      final response = await _client.get('${type.endpoint()}/popular');
      final result = (response.data['results'] as List)
          .map(
            (e) => FilmModel.fromJson(e),
          )
          .toList();
      return result;
    } catch (e) {
      throw const DatasourceException();
    }
  }

  Future<List<FilmModel>> getRecommendations(FilmType type, int id) async {
    try {
      final response = await _client.get(
        '${type.endpoint()}/$id/recommendations',
      );
      final result = (response.data['results'] as List)
          .map(
            (e) => FilmModel.fromJson(e),
          )
          .toList();
      return result;
    } catch (e) {
      throw const DatasourceException();
    }
  }

  Future<List<FilmModel>> getTopRated(FilmType type) async {
    try {
      final response = await _client.get('${type.endpoint()}/top_rated');
      final result = (response.data['results'] as List)
          .map(
            (e) => FilmModel.fromJson(e),
          )
          .toList();
      return result;
    } catch (e) {
      throw const DatasourceException();
    }
  }

  Future<List<FilmModel>> search(FilmType type, String query) async {
    try {
      final response =
          await _client.get('/search${type.endpoint()}?query=$query');
      final result = (response.data['results'] as List)
          .map(
            (e) => FilmModel.fromJson(e),
          )
          .toList();
      return result;
    } catch (e) {
      throw const DatasourceException();
    }
  }
}

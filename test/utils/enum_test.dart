import 'package:flutter_test/flutter_test.dart';
import 'package:moviex/utils/enum.dart';

void main() {
  test('Movie should success', () {
    expect(FilmType.movie.toString(), 'Movie');
  });
  test('TV should success', () {
    expect(FilmType.tv.toString(), 'TV');
  });
  test('Now Playing should success', () {
    expect(FilmListType.nowplaying.toString(), 'Now Playing');
  });
  test('Popular should success', () {
    expect(FilmListType.popular.toString(), 'Popular');
  });
  test('Top Rated should success', () {
    expect(FilmListType.toprated.toString(), 'Top Rated');
  });

  test('Boolean isTvFilms should return true', () {
    const tvFilmType = FilmType.tv;
    expect(tvFilmType.isTvFilms(), isTrue);
  });

  test('Boolean isMovieFilms should return true', () {
    const movieFilmType = FilmType.movie;
    expect(movieFilmType.isMovieFilms(), isTrue);
  });
}

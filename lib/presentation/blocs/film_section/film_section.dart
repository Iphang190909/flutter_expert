import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/state/view_state.dart';

part 'film_section.freezed.dart';

@freezed
class FilmSection with _$FilmSection {
  const factory FilmSection({
    required Map<String, FilmPairing> data,
  }) = _FilmSection;
}

@freezed
class FilmPairing with _$FilmPairing {
  const factory FilmPairing({
    required List<Film> filmData,
    required ViewState filmStatus,
  }) = _FilmPairing;
}

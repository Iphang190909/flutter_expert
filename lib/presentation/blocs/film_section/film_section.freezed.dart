// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'film_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilmSection {
  Map<String, FilmPairing> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilmSectionCopyWith<FilmSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilmSectionCopyWith<$Res> {
  factory $FilmSectionCopyWith(
          FilmSection value, $Res Function(FilmSection) then) =
      _$FilmSectionCopyWithImpl<$Res>;
  $Res call({Map<String, FilmPairing> data});
}

/// @nodoc
class _$FilmSectionCopyWithImpl<$Res> implements $FilmSectionCopyWith<$Res> {
  _$FilmSectionCopyWithImpl(this._value, this._then);

  final FilmSection _value;
  // ignore: unused_field
  final $Res Function(FilmSection) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, FilmPairing>,
    ));
  }
}

/// @nodoc
abstract class _$$_FilmSectionCopyWith<$Res>
    implements $FilmSectionCopyWith<$Res> {
  factory _$$_FilmSectionCopyWith(
          _$_FilmSection value, $Res Function(_$_FilmSection) then) =
      __$$_FilmSectionCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, FilmPairing> data});
}

/// @nodoc
class __$$_FilmSectionCopyWithImpl<$Res> extends _$FilmSectionCopyWithImpl<$Res>
    implements _$$_FilmSectionCopyWith<$Res> {
  __$$_FilmSectionCopyWithImpl(
      _$_FilmSection _value, $Res Function(_$_FilmSection) _then)
      : super(_value, (v) => _then(v as _$_FilmSection));

  @override
  _$_FilmSection get _value => super._value as _$_FilmSection;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_FilmSection(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, FilmPairing>,
    ));
  }
}

/// @nodoc

class _$_FilmSection implements _FilmSection {
  const _$_FilmSection({required final Map<String, FilmPairing> data})
      : _data = data;

  final Map<String, FilmPairing> _data;
  @override
  Map<String, FilmPairing> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'FilmSection(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilmSection &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_FilmSectionCopyWith<_$_FilmSection> get copyWith =>
      __$$_FilmSectionCopyWithImpl<_$_FilmSection>(this, _$identity);
}

abstract class _FilmSection implements FilmSection {
  const factory _FilmSection({required final Map<String, FilmPairing> data}) =
      _$_FilmSection;

  @override
  Map<String, FilmPairing> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FilmSectionCopyWith<_$_FilmSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilmPairing {
  List<Film> get filmData => throw _privateConstructorUsedError;
  ViewState get filmStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilmPairingCopyWith<FilmPairing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilmPairingCopyWith<$Res> {
  factory $FilmPairingCopyWith(
          FilmPairing value, $Res Function(FilmPairing) then) =
      _$FilmPairingCopyWithImpl<$Res>;
  $Res call({List<Film> filmData, ViewState filmStatus});

  $ViewStateCopyWith<$Res> get filmStatus;
}

/// @nodoc
class _$FilmPairingCopyWithImpl<$Res> implements $FilmPairingCopyWith<$Res> {
  _$FilmPairingCopyWithImpl(this._value, this._then);

  final FilmPairing _value;
  // ignore: unused_field
  final $Res Function(FilmPairing) _then;

  @override
  $Res call({
    Object? filmData = freezed,
    Object? filmStatus = freezed,
  }) {
    return _then(_value.copyWith(
      filmData: filmData == freezed
          ? _value.filmData
          : filmData // ignore: cast_nullable_to_non_nullable
              as List<Film>,
      filmStatus: filmStatus == freezed
          ? _value.filmStatus
          : filmStatus // ignore: cast_nullable_to_non_nullable
              as ViewState,
    ));
  }

  @override
  $ViewStateCopyWith<$Res> get filmStatus {
    return $ViewStateCopyWith<$Res>(_value.filmStatus, (value) {
      return _then(_value.copyWith(filmStatus: value));
    });
  }
}

/// @nodoc
abstract class _$$_FilmPairingCopyWith<$Res>
    implements $FilmPairingCopyWith<$Res> {
  factory _$$_FilmPairingCopyWith(
          _$_FilmPairing value, $Res Function(_$_FilmPairing) then) =
      __$$_FilmPairingCopyWithImpl<$Res>;
  @override
  $Res call({List<Film> filmData, ViewState filmStatus});

  @override
  $ViewStateCopyWith<$Res> get filmStatus;
}

/// @nodoc
class __$$_FilmPairingCopyWithImpl<$Res> extends _$FilmPairingCopyWithImpl<$Res>
    implements _$$_FilmPairingCopyWith<$Res> {
  __$$_FilmPairingCopyWithImpl(
      _$_FilmPairing _value, $Res Function(_$_FilmPairing) _then)
      : super(_value, (v) => _then(v as _$_FilmPairing));

  @override
  _$_FilmPairing get _value => super._value as _$_FilmPairing;

  @override
  $Res call({
    Object? filmData = freezed,
    Object? filmStatus = freezed,
  }) {
    return _then(_$_FilmPairing(
      filmData: filmData == freezed
          ? _value._filmData
          : filmData // ignore: cast_nullable_to_non_nullable
              as List<Film>,
      filmStatus: filmStatus == freezed
          ? _value.filmStatus
          : filmStatus // ignore: cast_nullable_to_non_nullable
              as ViewState,
    ));
  }
}

/// @nodoc

class _$_FilmPairing implements _FilmPairing {
  const _$_FilmPairing(
      {required final List<Film> filmData, required this.filmStatus})
      : _filmData = filmData;

  final List<Film> _filmData;
  @override
  List<Film> get filmData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filmData);
  }

  @override
  final ViewState filmStatus;

  @override
  String toString() {
    return 'FilmPairing(filmData: $filmData, filmStatus: $filmStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilmPairing &&
            const DeepCollectionEquality().equals(other._filmData, _filmData) &&
            const DeepCollectionEquality()
                .equals(other.filmStatus, filmStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filmData),
      const DeepCollectionEquality().hash(filmStatus));

  @JsonKey(ignore: true)
  @override
  _$$_FilmPairingCopyWith<_$_FilmPairing> get copyWith =>
      __$$_FilmPairingCopyWithImpl<_$_FilmPairing>(this, _$identity);
}

abstract class _FilmPairing implements FilmPairing {
  const factory _FilmPairing(
      {required final List<Film> filmData,
      required final ViewState filmStatus}) = _$_FilmPairing;

  @override
  List<Film> get filmData => throw _privateConstructorUsedError;
  @override
  ViewState get filmStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FilmPairingCopyWith<_$_FilmPairing> get copyWith =>
      throw _privateConstructorUsedError;
}

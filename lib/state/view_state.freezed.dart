// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewInitial value) initial,
    required TResult Function(ViewLoading value) loading,
    required TResult Function(ViewSuccess value) success,
    required TResult Function(ViewError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewStateCopyWith<$Res> {
  factory $ViewStateCopyWith(ViewState value, $Res Function(ViewState) then) =
      _$ViewStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ViewStateCopyWithImpl<$Res> implements $ViewStateCopyWith<$Res> {
  _$ViewStateCopyWithImpl(this._value, this._then);

  final ViewState _value;
  // ignore: unused_field
  final $Res Function(ViewState) _then;
}

/// @nodoc
abstract class _$$ViewInitialCopyWith<$Res> {
  factory _$$ViewInitialCopyWith(
          _$ViewInitial value, $Res Function(_$ViewInitial) then) =
      __$$ViewInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViewInitialCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$$ViewInitialCopyWith<$Res> {
  __$$ViewInitialCopyWithImpl(
      _$ViewInitial _value, $Res Function(_$ViewInitial) _then)
      : super(_value, (v) => _then(v as _$ViewInitial));

  @override
  _$ViewInitial get _value => super._value as _$ViewInitial;
}

/// @nodoc

class _$ViewInitial implements ViewInitial {
  const _$ViewInitial();

  @override
  String toString() {
    return 'ViewState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ViewInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewInitial value) initial,
    required TResult Function(ViewLoading value) loading,
    required TResult Function(ViewSuccess value) success,
    required TResult Function(ViewError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ViewInitial implements ViewState {
  const factory ViewInitial() = _$ViewInitial;
}

/// @nodoc
abstract class _$$ViewLoadingCopyWith<$Res> {
  factory _$$ViewLoadingCopyWith(
          _$ViewLoading value, $Res Function(_$ViewLoading) then) =
      __$$ViewLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViewLoadingCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$$ViewLoadingCopyWith<$Res> {
  __$$ViewLoadingCopyWithImpl(
      _$ViewLoading _value, $Res Function(_$ViewLoading) _then)
      : super(_value, (v) => _then(v as _$ViewLoading));

  @override
  _$ViewLoading get _value => super._value as _$ViewLoading;
}

/// @nodoc

class _$ViewLoading implements ViewLoading {
  const _$ViewLoading();

  @override
  String toString() {
    return 'ViewState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ViewLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewInitial value) initial,
    required TResult Function(ViewLoading value) loading,
    required TResult Function(ViewSuccess value) success,
    required TResult Function(ViewError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ViewLoading implements ViewState {
  const factory ViewLoading() = _$ViewLoading;
}

/// @nodoc
abstract class _$$ViewSuccessCopyWith<$Res> {
  factory _$$ViewSuccessCopyWith(
          _$ViewSuccess value, $Res Function(_$ViewSuccess) then) =
      __$$ViewSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViewSuccessCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$$ViewSuccessCopyWith<$Res> {
  __$$ViewSuccessCopyWithImpl(
      _$ViewSuccess _value, $Res Function(_$ViewSuccess) _then)
      : super(_value, (v) => _then(v as _$ViewSuccess));

  @override
  _$ViewSuccess get _value => super._value as _$ViewSuccess;
}

/// @nodoc

class _$ViewSuccess implements ViewSuccess {
  const _$ViewSuccess();

  @override
  String toString() {
    return 'ViewState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ViewSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewInitial value) initial,
    required TResult Function(ViewLoading value) loading,
    required TResult Function(ViewSuccess value) success,
    required TResult Function(ViewError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ViewSuccess implements ViewState {
  const factory ViewSuccess() = _$ViewSuccess;
}

/// @nodoc
abstract class _$$ViewErrorCopyWith<$Res> {
  factory _$$ViewErrorCopyWith(
          _$ViewError value, $Res Function(_$ViewError) then) =
      __$$ViewErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViewErrorCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$$ViewErrorCopyWith<$Res> {
  __$$ViewErrorCopyWithImpl(
      _$ViewError _value, $Res Function(_$ViewError) _then)
      : super(_value, (v) => _then(v as _$ViewError));

  @override
  _$ViewError get _value => super._value as _$ViewError;
}

/// @nodoc

class _$ViewError implements ViewError {
  const _$ViewError();

  @override
  String toString() {
    return 'ViewState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ViewError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewInitial value) initial,
    required TResult Function(ViewLoading value) loading,
    required TResult Function(ViewSuccess value) success,
    required TResult Function(ViewError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewInitial value)? initial,
    TResult Function(ViewLoading value)? loading,
    TResult Function(ViewSuccess value)? success,
    TResult Function(ViewError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ViewError implements ViewState {
  const factory ViewError() = _$ViewError;
}
